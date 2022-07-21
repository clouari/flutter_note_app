import 'package:flutter/material.dart';
import 'package:flutter_note_app/presentation/add_edit_note/add_edit_note_event.dart';
import 'package:flutter_note_app/presentation/add_edit_note/add_edit_note_view_model.dart';
import 'package:flutter_note_app/ui/colors.dart';
import 'package:provider/provider.dart';

class AddEditNoteScreen extends StatefulWidget {
  const AddEditNoteScreen({Key? key}) : super(key: key);

  @override
  State<AddEditNoteScreen> createState() => _AddEditNoteScreenState();
}

class _AddEditNoteScreenState extends State<AddEditNoteScreen> {
  final TextEditingController _titleController = TextEditingController();
  // final _titleController = TextEditingController(); 로 해도 ok
  final TextEditingController _contentController = TextEditingController();

  // 위에 선택할 컬러 Row list
  final List<Color> noteColors = [
    roseBud,
    primrose,
    wisteria,
    skyBlue,
    illusion
  ];

  // Color _color = roseBud; //제거함

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<AddEditNoteViewModel>();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.save),
      ),
      body: AnimatedContainer(
        // 부드럽게 바뀌는 효과를 원한다면 AnimatedContainer로 duration만 지정해주기
        padding: const EdgeInsets.only(left: 16, right: 16, top: 48),
        color: Color(viewModel.color),
        duration: const Duration(milliseconds: 500),
        child: Column(
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
