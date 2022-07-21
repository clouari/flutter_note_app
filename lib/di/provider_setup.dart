import 'package:flutter_note_app/data/data_source/note_db_helper.dart';
import 'package:flutter_note_app/data/repository/note_repository_impl.dart';
import 'package:flutter_note_app/domain/repository/note_repository.dart';
import 'package:flutter_note_app/presentation/add_edit_note/add_edit_note_view_model.dart';
import 'package:flutter_note_app/presentation/notes/notes_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:sqflite/sqflite.dart';

Future<List<SingleChildWidget>> getProviders() async {
//  DB를 비동기로 열고 여기서 생성하려고 함
  Database database = await openDatabase(
    'notes_db',
    version: 1,
    onCreate: (db, version) async {
      await db.execute(
          'CREATE TABLE note ( id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, content TEXT, color INTEGER, timestamp INTEGER)');
    },
  );

/* db를 통해서 Notedbhelper를 만들 수 있음 */
  NoteDbHelper noteDbHelper = NoteDbHelper(database);
  NoteRepository repository = NoteRepositoryImpl(noteDbHelper);
  NotesViewModel notesViewModel = NotesViewModel(repository);
  AddEditNoteViewModel addEditNoteViewModel = AddEditNoteViewModel(repository);

// /* 독립적인 provider 관리 */
//   List<SingleChildWidget> independentModels = [];
//
// /* 의존성이 있는 객체 */
//   List<SingleChildWidget> dependentModels = [];
//
// /* viewmodel */
//   List<SingleChildWidget> viewModels = [];
//
// /* 전체적인 provider 관리 */
//   List<SingleChildWidget> globalProviders = [
//     // ... 으로 다 가지고 있으면서 여기서만 의존성 관리를 하려고 함.
//     ...independentModels,
//     ...dependentModels,
//     ...viewModels,
//   ];

  return [
    ChangeNotifierProvider(create: (_) => notesViewModel),
    ChangeNotifierProvider(create: (_) => addEditNoteViewModel),
  ];
}
