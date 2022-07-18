// domain > model > Note앱 에서는 크게 2가지를 담을 수 있음 (제목, 내용, 필요한 것들 등등)
// 먼저 구성하고 dataclass freezed로 아래 완성하기
// class Note {
//   String title;
//   String content;
//   int color;
//   int timestamp;
//   int? id; // 상황에 따라 id는 모를 수도 있기 때문에 nullable 처리하기
// }

import 'package:freezed_annotation/freezed_annotation.dart';

part 'note.freezed.dart';
part 'note.g.dart';

@freezed
class Note with _$Note {
  factory Note(
      {required String title,
      required String content,
      required int color,
      required int timestamp,
      int? id // 상황에 따라 id는 모를 수도 있기 때문에 nullable 처리하기
      }) = _Note;

  factory Note.fromJson(Map<String, dynamic> json) => _$NoteFromJson(json);
}
