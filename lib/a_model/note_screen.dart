import 'package:flutter/material.dart';
import 'package:note_app/a_model/note_data.dart';

class NoteScreenModelPart extends StatefulWidget {
  const NoteScreenModelPart({super.key});

  @override
  State<NoteScreenModelPart> createState() => _NoteScreenModelPartState();
}

class _NoteScreenModelPartState extends State<NoteScreenModelPart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Note Model Practice"), centerTitle: true),
      body: ListView.builder(
        itemCount: NoteDataModelPart().notes.length,
        itemBuilder: (context, index) => ListTile(
          leading: Text("${NoteDataModelPart().note1[index].id}"),
          title: Text(NoteDataModelPart().note1[index].title),
          subtitle: Text("${NoteDataModelPart().note1[index].details}"),
        ),
      ),
    );
  }
}
