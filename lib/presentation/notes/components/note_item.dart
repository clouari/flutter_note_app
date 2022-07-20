import 'package:flutter/material.dart';
import 'package:flutter_note_app/domain/model/note.dart';
import 'package:flutter_note_app/ui/colors.dart';

class NoteItem extends StatelessWidget {
  final Note note;
  final Function? onDeleteTab;

  const NoteItem({Key? key, required this.note, this.onDeleteTab})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(note.color),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  note.title,
                  maxLines: 1, // 최대 한 줄까지만 보여주기
                  overflow: TextOverflow.ellipsis, // 넘어가는 것은 ... 으로!
                  style: Theme.of(context)
                      .textTheme
                      .headline6, // 하나하나 상세지정하지 말고 동일하게 theme으로!
                ),
                const SizedBox(height: 8),
                Text(
                  note.content,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 8,
            right: 8,
            child: GestureDetector(
              onTap: () {
                onDeleteTab?.call();
                //onDeleteTab이 nullable이 아니라면 .call() 생략이 가능하다.
              },
              child: const Icon(Icons.delete, color: darkGray),
            ),
          ),
        ],
      ),
    );
  }
}
