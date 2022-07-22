import 'package:flutter_note_app/domain/model/note.dart';
import 'package:flutter_note_app/domain/repository/note_repository.dart';

class GetNoteUseCase {
  final NoteRepository repository;

  GetNoteUseCase(this.repository);

  // note가 없을 수도 있기에 nullable로 받아오기
  Future<Note?> call(int id) async {
    return await repository.getNoteById(id);
  }
}
