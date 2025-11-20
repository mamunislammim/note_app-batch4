import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:note_app/database/notes.dart';
import 'package:note_app/view/note/widgets/delete_dialogue.dart';
import 'package:note_app/view/note/widgets/note_card.dart';
import 'package:note_app/view/note/widgets/note_drawer.dart';
import 'package:note_app/view/note/widgets/search_field.dart';
import 'package:note_app/view/note_add_edit/add.dart';

import '../note_view/view.dart';

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
      drawer: NoteDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: Text("Notes", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [SearchFieldWidget(), SizedBox(height: 10), noteBuilder()]),
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => NoteAddScreen())).then((c) {
            setState(() {});
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Expanded noteBuilder() {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: NotesData.list.length,
        itemBuilder: (context, index) => InkWell(
          onLongPress: () {
            showDialog(
              context: context,
              builder: (context) => DeleteDialogue(
                onTap: () {
                  NotesData.list.removeAt(index);
                  Navigator.pop(context);
                },
              ),
            );
          },
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NoteViewScreen(
                  title: "${NotesData.list[index]['title']}",
                  date: "${NotesData.list[index]['created_at']}",
                  details: "${NotesData.list[index]['details']}",
                ),
              ),
            );
          },
          child: NoteCardWidget(
            i: index,
            onTap: () {
              NotesData.trashList.add(NotesData.list[index]);
              NotesData.list.removeAt(index);
              setState(() {});
            },
          ),
        ),
      ),
    );
  }
}
