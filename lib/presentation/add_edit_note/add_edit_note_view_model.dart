import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_note_app/domain/model/note.dart';
import 'package:flutter_note_app/domain/repository/note_repository.dart';
import 'package:flutter_note_app/presentation/add_edit_note/add_edit_note_event.dart';
import 'package:flutter_note_app/presentation/add_edit_note/add_edit_note_ui_event.dart';
import 'package:flutter_note_app/ui/colors.dart';

class AddEditNoteViewModel with ChangeNotifier {
  final NoteRepository repository;

  int _color = roseBud.value;
  // Colors.orange.value; // private color 값이 int 이기 때문에 아래처럼 값 변경하기
  int get color => _color;

  // 여기서 이벤트를 받아주는 코드 stream 으로 작성
  final _eventController = StreamController<AddEditNoteUiEvent>.broadcast();
  //broadcast 생성자를 사용하면 이렇게 생성된 컨트롤러는 여러번 listen을 할 수 있는 형태가 된다.
  Stream<AddEditNoteUiEvent> get eventStream => _eventController.stream;

  AddEditNoteViewModel(this.repository);

  void onEvent(AddEditNoteEvent event) {
    event.when(changeColor: _changeColor, saveNote: _saveNote);
  }

  // 아래부분 만들어 놓고, 위에서 연결
  Future<void> _changeColor(int color) async {
    _color = color;
    notifyListeners();
  }

  Future<void> _saveNote(int? id, String title, String content) async {
    if (id == null) {
      await repository.insertNote(
        Note(
          title: title,
          content: content,
          timestamp: DateTime.now().millisecondsSinceEpoch,
          color: _color,
        ),
      );
    } else {
      await repository.updateNote(
        Note(
            id: id,
            title: title,
            content: content,
            timestamp: DateTime.now().millisecondsSinceEpoch,
            color: _color),
      );
    }

    _eventController.add(const AddEditNoteUiEvent.saveNote());
  }
}
