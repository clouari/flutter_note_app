import 'package:flutter_note_app/domain/model/note.dart';
import 'package:flutter_note_app/domain/repository/note_repository.dart';
import 'package:flutter_note_app/domain/util/note_order.dart';

// 모든 노트 불러오는 use_case
class GetNotesUseCase {
  final NoteRepository repository;

  GetNotesUseCase(this.repository);

  /*모든 class 가 가지고 있는 call method 재정의하기*/
  Future<List<Note>> call(NoteOrder noteOrder) async {
    List<Note> notes = await repository.getNotes();

    noteOrder.when(
      title: (orderType) {},
      date: (orderType) {
        orderType.when(
          ascending: () {},
          descending: () {
            notes.sort((a, b) => -a.timestamp.compareTo(b.timestamp));
          },
        );
      },
      color: (orderType) {},
    );
    return notes;
  }
}
