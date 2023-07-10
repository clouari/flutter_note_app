// 안에 요소는 아직 알 순 없지만,
// NoteRepositoryImpl class 활용할 것임
import 'package:flutter_note_app/domain/model/note.dart';
import 'package:sqflite/sqflite.dart';

class NoteDbHelper {
  // 데이터베이스 타입을 받을 예정
  Database db;

  // 생성자에서 db 받기
  NoteDbHelper(this.db);

  Future<Note?> getNoteById(int id) async {
    /* table 이름을 note라고 지정
     SELECT * FROM note WHERE id = 1 에 해당
     note의 id가 여기서 지정한 id 값으로 맵핑 되면서 sql문의 where절에 해당됨. */

    final List<Map<String, dynamic>> maps = await db.query(
      'note',
      where: 'id = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Note.fromJson(maps.first);
    }
    return null;
  }

  /* 전체 노트 가져오는 기능 */
  Future<List<Note>> getNotes() async {
    final maps = await db.query('note');
    return maps.map((e) => Note.fromJson(e)).toList();
  }

  /* 노트를 추가하는 insert 기능
     insert 기능은 추가된 객체의 id를 return하고 있는데 만약 추가가 안됐으면 0이 return 된다. */
  Future<void> insertNote(Note note) async {
    await db.insert('note', note.toJson());
  }

  /* 업데이트 기능
  update 기능은 추가된 객체의 count를 return하고 있는데 몇 개의 데이터가 적용이 됐는지 필요하면 return 받으면 된다. 활용을 안할거면 void 를 return */
  Future<void> updateNote(Note note) async {
    await db.update(
      'note',
      note.toJson(),
      where: 'id = ?',
      whereArgs: [note.id],
    );
  }

  /* 삭제기능 */
  Future<void> deleteNote(Note note) async {
    await db.delete(
      'note',
      where: 'id = ?',
      whereArgs: [note.id],
    );
  }
}
