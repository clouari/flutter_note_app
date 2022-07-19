import 'package:flutter/cupertino.dart';
import 'package:flutter_note_app/domain/repository/note_repository.dart';

class NotesViewModel with ChangeNotifier {
  final NoteRepository repository;

  NotesViewModel(this.repository);
}
