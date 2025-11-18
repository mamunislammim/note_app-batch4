import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:note_app/database/notes.dart';

class NoteAddScreen extends StatefulWidget {
  const NoteAddScreen({super.key});

  @override
  State<NoteAddScreen> createState() => _NoteAddScreenState();
}

class _NoteAddScreenState extends State<NoteAddScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController detailsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Note Add Screen")),
      body: Padding(
        padding: const EdgeInsets.all(2.0),
        child: SingleChildScrollView(
          child: Column(
            spacing: 20,
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  hintText: "Title",
                  border: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(15)),
                ),
              ),
              TextField(
                controller: detailsController,
                maxLines: 100,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  hintText: "Details",
                  border: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(15)),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          log("==========");
          log("${titleController.text}");
          log("${detailsController.text}");
          log("==========");
          Map<String, dynamic> data = {
            "title": titleController.text,
            "details": detailsController.text,
            "id": 1,
            "created_at": "${DateTime.now()}",
          };
          log("====================>>>>>>>> $data");
          log("====================>>>>>>>> ${NotesData.list.length}");
          NotesData.list.add(data);
          log("====================++++++ ${NotesData.list.length}");
          Navigator.pop(context);
        },
        child: Text("Save"),
      ),
    );
  }
}
