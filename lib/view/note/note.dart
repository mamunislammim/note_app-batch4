import 'package:flutter/material.dart';
import 'package:note_app/database/notes.dart';
import 'package:note_app/view/note/widgets/note_card.dart';
import 'package:note_app/view/note/widgets/search_field.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({super.key});

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF1F1F1),
      appBar: AppBar(
        centerTitle: true,
        title: Text("Notes", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [SearchFieldWidget(), SizedBox(height: 10), noteBuilder()]),
      ),
    );
  }

  Expanded noteBuilder() {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: NotesData.list.length,
        itemBuilder: (context, index) => NoteCardWidget(i: index),
      ),
    );
  }
}
