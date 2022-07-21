import 'package:flutter/material.dart';
import 'package:flutter_note_app/presentation/add_edit_note/add_edit_note_screen.dart';
import 'package:flutter_note_app/presentation/notes/components/note_item.dart';
import 'package:flutter_note_app/presentation/notes/notes_event.dart';
import 'package:flutter_note_app/presentation/notes/notes_view_model.dart';
import 'package:provider/provider.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<NotesViewModel>();
    final state = viewModel.state;

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          'Your note',
          style: TextStyle(fontSize: 30),
        ),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.sort),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          bool? isSaved = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddEditNoteScreen()),
            // 정보를 가지고 있는 객체, 화면 전환이나 화면 사이즈 등등 많은 것을 알고 있다.
          );

          // 만약 isSaved가 null이 아니고, true이면
          if (isSaved != null && isSaved) {
            viewModel.onEvent(const NotesEvent.loadNotes());
          }
        },
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: state.notes
              .map(
                (note) => NoteItem(
                  note: note,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
