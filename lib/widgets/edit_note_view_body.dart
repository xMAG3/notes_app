import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/notes_cubit/cubit/notes_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/widgets/custom_app_bar.dart';
import 'package:note_app/widgets/custom_text_field.dart';
import 'package:note_app/widgets/edit_note_colors_list_view.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, this.note});
  final NoteModel? note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  String? title, content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(height: 50),
          CustomAppBar(
            onPressed: () {
              widget.note!.title = title ?? widget.note!.title;
              widget.note!.subTitle = content ?? widget.note!.subTitle;
              widget.note!.save();
              BlocProvider.of<NotesCubit>(context).fetchAllNotes();
              Navigator.pop(context);
            },
            title: 'Edit Note',
            icon: Icons.check,
          ),
          const SizedBox(height: 20),
          CustomTextField(
            onChanged: (value) {
              title = value;
            },
            hintText: widget.note!.title,
          ),
          const SizedBox(height: 16),
          CustomTextField(
            onChanged: (value) {
              content = value;
            },
            hintText: widget.note!.subTitle,
            maxLines: 5,
          ),
          const SizedBox(height: 32),
          EditNotesColorsList(note: widget.note!),
        ],
      ),
    );
  }
}


