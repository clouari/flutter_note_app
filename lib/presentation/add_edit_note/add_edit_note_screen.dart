import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_note_app/domain/model/note.dart';
import 'package:flutter_note_app/presentation/add_edit_note/add_edit_note_event.dart';
import 'package:flutter_note_app/presentation/add_edit_note/add_edit_note_view_model.dart';
import 'package:flutter_note_app/ui/colors.dart';
import 'package:provider/provider.dart';

class AddEditNoteScreen extends StatefulWidget {
  // 이것 가지고 노트 저장할 떼 판별힘
  final Note? note;

  const AddEditNoteScreen({Key? key, this.note}) : super(key: key);

  @override
  State<AddEditNoteScreen> createState() => _AddEditNoteScreenState();
}

class _AddEditNoteScreenState extends State<AddEditNoteScreen> {
  final TextEditingController _titleController = TextEditingController();
  // final _titleController = TextEditingController(); 로 해도 ok
  final TextEditingController _contentController = TextEditingController();

  // 버그!! 메모를 하나만 저장하는건 정상적으로 작동하는데, 두 개부턴 메모는 저장이 되지만 화면이 갱신되지 않음
  //  StreamSubscription 이 있다면 캔슬해주기
  StreamSubscription? _streamSubscription;

  // 위에 선택할 컬러 Row list
  final List<Color> noteColors = [
    roseBud,
    primrose,
    wisteria,
    skyBlue,
    illusion
  ];

  @override
  void initState() {
    super.initState();

    if (widget.note != null) {
      _titleController.text = widget.note!.title;
      _contentController.text = widget.note!.content;
    }

    Future.microtask(() {
      final viewModel = context.read<AddEditNoteViewModel>();
      // initState 안에서는 read로 읽어줘야 함!!!

      // 여기서 이벤트를 받아주는 코드 작성하기 stream 으로 작성
      //  StreamSubscription 이 있다면 캔슬해주기 위해 코드 추가
      _streamSubscription = viewModel.eventStream.listen((event) {
        event.when(saveNote: () {
          Navigator.pop(context, true);
          // true 가 되면 savenote가 동작하면서 화면이 넘어갔다는 의미를 주기 때문에 필요함.
          // 아무것도 넘어가지 않는다몀 사용자가 뒤로가기를 누른 것임.
        }, showSnackBar: (String message) {
          final snackBar = SnackBar(
            content: Text(message),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        });
      });
    });
  }
  // Color _color = roseBud; //제거함

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // viewmodel 얻는 코드
    final viewModel = context.watch<AddEditNoteViewModel>();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          viewModel.onEvent(
            AddEditNoteEvent.saveNote(
                // note가 null이면 id도 null이고, null이 아니면 note.id 이다.
                widget.note == null ? null : widget.note!.id,
                _titleController.text,
                _contentController.text),
          );
        },
        child: Icon(Icons.save),
      ),
      body: AnimatedContainer(
        // 부드럽게 바뀌는 효과를 원한다면 AnimatedContainer로 duration만 지정해주기
        padding: const EdgeInsets.only(left: 16, right: 16, top: 48),
        color: Color(viewModel.color),
        duration: const Duration(milliseconds: 500),
        child: ListView(
          // 가로모드로 했을 때 영역이 넘어가니 공사장 나타남 -> ListView로 연결 해 주면 에러해결
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: noteColors
                  .map(
                    (color) => InkWell(
                      onTap: () {
                        viewModel
                            .onEvent(AddEditNoteEvent.changeColor(color.value));
                      },
                      child: _buildBackgroundColor(
                        color: color,
                        selected: viewModel.color == color.value,
                        // 한 쪽은 숫자로 관리하고, 한 쪽은 컬러고 하면서 타입이 달라서 맞춰주는 과정이 필요함.
                        // 숫자인 경우엔 .value 해줄 것.
                      ),
                    ),
                  )
                  .toList(),
            ),
            TextField(
              controller: _titleController,
              maxLines: 1,
              style: Theme.of(context).textTheme.headline5!.copyWith(
                    color: darkGray,
                  ),
              decoration: InputDecoration(
                hintText: '제목을 입력하세요',
                border: InputBorder.none,
              ),
            ),
            TextField(
              controller: _contentController,
              maxLines: null,
              //maxLines 가 보면 nullable이라 null을 넣으면 텍스트가 넘어가지 않고 내려간다.
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: darkGray,
                  ),
              decoration: InputDecoration(
                hintText: '내용을 입력하세요',
                border: InputBorder.none,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBackgroundColor({
    required Color color,
    required bool selected,
  }) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.7),
            blurRadius: 5.0,
            spreadRadius: 1.0, // 좀 더 진해짐
          )
        ],
        border: selected
            ? Border.all(
                color: Colors.black,
                width: 2.0,
              )
            : null,
        // selected 가 true면 보이고, false면 보이지 않게!
      ),
    );
  }
}
