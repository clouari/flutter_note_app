import 'package:flutter_note_app/data/data_source/note_db_helper.dart';
import 'package:flutter_note_app/domain/model/note.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  test(
    'db test',
    () async {
      final db = await databaseFactoryFfi.openDatabase(inMemoryDatabasePath);
      // 메모리에 임시로 db를 작성할 수 있음

      // NOTE model에 해당하는 데이터를 그대로 sql문으로 작성
      await db.execute(
          'CREATE TABLE note ( id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, content TEXT, color INTEGER, timestamp INTEGER)');

      final noteDbHelper = NoteDbHelper(db);

      await noteDbHelper.insertNote(
          Note(title: 'test', content: 'test', color: 1, timestamp: 1));

      expect((await noteDbHelper.getNotes()).length, 1);

      // db 종료를 해 주어야 test가 오래 걸리지 않음
      await db.close();
    },
  );
}
