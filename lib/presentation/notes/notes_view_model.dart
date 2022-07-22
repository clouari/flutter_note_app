import 'package:flutter/cupertino.dart';
import 'package:flutter_note_app/domain/model/note.dart';
import 'package:flutter_note_app/domain/use_case/use_cases.dart';
import 'package:flutter_note_app/presentation/notes/notes_event.dart';
import 'package:flutter_note_app/presentation/notes/notes_state.dart';

class NotesViewModel with ChangeNotifier {
  //final NoteRepository repository;
  // final GetNotesUseCase getNotes;
  // final DeleteNoteUseCase deleteNote;
  // final AddNoteUseCase addNote;
  final UseCases useCases;

  NotesState _state = NotesState(notes: []);
  NotesState get state => _state;

  // List<Note> _notes = [];
  // UnmodifiableListView<Note> get notes => UnmodifiableListView(_notes);
  // // private 으로 외부에서 접근 불가능하게 선언했으면, nmodifiableListView , getter로 외부에 노출하기

  Note? _recentlyDeletedNote; // 마지막에 삭제된 노트는 여기에 저장

  NotesViewModel(this.useCases) {
    _loadNotes();
  }

  /* 인간이 놓칠 수 있는 것들을 놓치지 않기 위해 만드는 것
  * -> 이 화면에서 발생하는 이벤트들은 onEvent라는 하나의 메서드 통해서만 실행할 것임.
   */
  void onEvent(NotesEvent event) {
    event.when(
      loadNotes: _loadNotes,
      deleteNote: _deleteNote,
      restoreNote: _restoreNote,
    );
  }

  /* loadNotes */
  Future<void> _loadNotes() async {
    List<Note> notes = await useCases.getNotes();
    /* 정렬기준: 날짜순으로, a 와 b의 timestamp를 비교한 후에 정렬 -> compareto 기본: 오름차순*/
    //notes.sort((a, b) => -a.timestamp.compareTo(b.timestamp));
    // 갖고오면 이 데이터를 저장할 부분이 필요하기 때문에 10번줄에서 공간 만들어 주기
    _state = state.copyWith(
      notes: notes,
      //notes로 갱신을 하겠다!
    );
    notifyListeners(); // 이후에 provider 사용할 것이기 때문에 상태가 바뀔 땐 notifyListeners 선언해주기
  }

  /* DeleteNotes */
  Future<void> _deleteNote(Note note) async {
    await useCases.deleteNote(note);

    _recentlyDeletedNote = note; // 마지막에 delete된 노트는 여기에 저장을 함

    await _loadNotes(); // 삭제를 해 준 다음에는 데이터를 다시 읽어올 것
    //notifyListeners(); // 이후에 provider 사용할 것이기 때문에 상태가 바뀔 땐 notifyListeners 선언해주기
  }

  /* restoreNote */
  Future<void> _restoreNote() async {
    /* 만약 삭제된 노트가 null이 아니라면(있다면) 삭제된 정보를 가지고, insert를 해 줌
     이후에 _recentlyDeletedNote를 다시 비워줌
     restore가 되면 다시 load를 하자! */

    if (_recentlyDeletedNote != null) {
      useCases.addNote(_recentlyDeletedNote!);
      _recentlyDeletedNote = null;

      _loadNotes();
    }
  }
}
