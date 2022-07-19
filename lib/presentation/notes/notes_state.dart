import 'package:flutter_note_app/domain/model/note.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notes_state.freezed.dart';
part 'notes_state.g.dart';

@freezed
class NotesState with _$NotesState {
  factory NotesState({
    //default 값을 넣고 싶으면, @Default([])
    @Default([]) List<Note> notes,
  }) = _NotesState;

  factory NotesState.fromJson(Map<String, dynamic> json) =>
      _$NotesStateFromJson(json);
}
