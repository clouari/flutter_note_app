import 'package:flutter_note_app/domain/model/note.dart';
import 'package:flutter_note_app/domain/repository/note_repository.dart';

class DeleteNoteUseCase {
  // note를 디루려면 NoteRepository가 필요함
  final NoteRepository repository;

  DeleteNoteUseCase(this.repository);

  Future<void> call(Note note) async {
    await repository.deleteNote(note);
  }
}
