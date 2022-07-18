// 동작해야 하는 기능들 생각하기
import 'package:flutter_note_app/domain/model/note.dart';

abstract class NoteRepository {
  // 1. Note 객체를 얻는 기능을 비동기로 만들어두기
  Future<List<Note>> getNotes();

  // 2. 클릭을 하면 해당 노트를 가지고 오는 것
  Future<Note> getNoteById(int it);

  // 3. 노트 추가
  Future<void> insertNote(Note note);

  // 4. update
  Future<void> updateNote(Note note);

  // 5. delete
  Future<void> deleteNote(Note note);
}
