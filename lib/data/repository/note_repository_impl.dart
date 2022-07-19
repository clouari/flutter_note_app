import 'package:flutter_note_app/data/data_source/note_db.dart';
import 'package:flutter_note_app/domain/model/note.dart';
import 'package:flutter_note_app/domain/repository/note_repository.dart';

class NoteRepositoryImpl implements NoteRepository {
  final NoteDb db;
  // generate (comm+N) 생성자 만들어주기

  NoteRepositoryImpl(this.db);

  @override
  Future<void> deleteNote(Note note) {
    // TODO: implement deleteNote
    throw UnimplementedError();
  }

  @override
  Future<Note> getNoteById(int it) {
    // TODO: implement getNoteById
    throw UnimplementedError();
  }

  @override
  Future<List<Note>> getNotes() {
    // TODO: implement getNotes
    throw UnimplementedError();
  }

  @override
  Future<void> insertNote(Note note) {
    // TODO: implement insertNote
    throw UnimplementedError();
  }

  @override
  Future<void> updateNote(Note note) {
    // TODO: implement updateNote
    throw UnimplementedError();
  }
}
