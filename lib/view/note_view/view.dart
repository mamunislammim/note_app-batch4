import 'package:flutter/material.dart';

class NoteViewScreen extends StatelessWidget {
  const NoteViewScreen({super.key, required this.title, required this.date, required this.details});

  final String title;
  final String date;
  final String details;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Note Details Screen")),
      body: Center(child: Column(children: [Text("$title"), Text("$date"), Text("$details")])),
    );
  }
}
