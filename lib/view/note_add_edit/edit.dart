import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:note_app/database/notes.dart';

class NoteEditScreen extends StatefulWidget {
  const NoteEditScreen({super.key, required this.title, required this.details, required this.id, required this.index});

  final int index;
  final String title;
  final String details;
  final int id;
  @override
  State<NoteEditScreen> createState() => _NoteAddScreenState();
}

class _NoteAddScreenState extends State<NoteEditScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController detailsController = TextEditingController();

  assignData(){
    titleController.text = "widget.title";
    detailsController.text = "widget.details";
  }

  @override
  void initState() {
    assignData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    log("=====${widget.title}=========");
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
          Map<String, dynamic> data = {
            "title": titleController.text,
            "details": detailsController.text,
            "id": widget.id,
            "created_at": "${DateTime.now()}",
          };
          NotesData.list[widget.index] = data;
          Navigator.pop(context);
        },
        child: Text("Save"),
      ),
    );
  }
}
