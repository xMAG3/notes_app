import 'package:flutter/material.dart';
import 'package:note_app/constants.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/widgets/colors_list_view.dart';

class EditNotesColorsList extends StatefulWidget {
  const EditNotesColorsList({super.key, required this.note});

  final NoteModel note;

  @override
  State<EditNotesColorsList> createState() => _EditNotesColorsListState();
}

class _EditNotesColorsListState extends State<EditNotesColorsList> {
  late int selectedIndex;

  @override
  void initState() {
    selectedIndex = kColors.indexOf(Color(widget.note.color));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35 * 2,
      child: ListView.builder(
        itemCount: kColors.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            child: GestureDetector(
              onTap: () {
                var selectedIndex = index;
                widget.note.color = kColors[index].value;
              },
              child: ColorItem(
                isSelected: selectedIndex == index,
                color: kColors[index],
              ),
            ),
          );
        },
      ),
    );
  }
}