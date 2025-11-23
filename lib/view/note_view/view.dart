import 'dart:developer';

import 'package:flutter/material.dart';

import '../note_add_edit/edit.dart';

class NoteViewScreen extends StatelessWidget {
  const NoteViewScreen({
    super.key,
    required this.title,
    required this.date,
    required this.details,
    required this.id,
    required this.index,
  });

  final int index;
  final int id;
  final String title;
  final String date;
  final String details;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Note Details Screen"),
        actions: [
          InkWell(
            onTap: () {
              log("================");
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (c) => NoteEditScreen(index: index, title: title, details: details, id: id),
                ),
              );
            },
            child: Icon(Icons.edit_note_outlined),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: Center(child: Column(children: [Text("$id"), Text("$title"), Text("$date"), Text("$details")])),
    );
  }
}
