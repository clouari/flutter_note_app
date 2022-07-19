import 'package:flutter_note_app/data/data_source/note_db.dart';
import 'package:flutter_note_app/domain/model/note.dart';
import 'package:flutter_note_app/domain/repository/note_repository.dart';

class NoteRepositoryImpl implements NoteRepository {
  final NoteDb db;
  // generate (comm+N) 생성자 만들어주기
  // return이 없을 때는 await , return 이면서 결과를 받아서 써주기 위해서는 return await 같이 써주면 된다.

  NoteRepositoryImpl(this.db);

  @override
  Future<void> deleteNote(Note note) async {
    await db.deleteNote(note);
  }

  /* nullable 처리 하면서 note_repo_impl 에서도 같이 nullable로 변경함 */
  @override
  Future<Note?> getNoteById(int id) async {
    return await db.getNoteById(id);
  }

  @override
  Future<List<Note>> getNotes() async {
    return await db.getNotes();
  }

  @override
  Future<void> insertNote(Note note) async {
    await db.insertNote(note);
  }

  @override
  Future<void> updateNote(Note note) async {
    await db.updateNote(note);
  }
}
