import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_edit_note_ui_event.freezed.dart';

@freezed
abstract class AddEditNoteUiEvent with _$AddEditNoteUiEvent {
  // saveNote라는 이벤트 정의를 하고, 화면쪽에서 처리 하는 것
  const factory AddEditNoteUiEvent.saveNote() = SaveNote;
}
