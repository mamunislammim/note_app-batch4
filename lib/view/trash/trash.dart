import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:note_app/database/notes.dart';

class TrashScreen extends StatefulWidget {
  const TrashScreen({super.key});

  @override
  State<TrashScreen> createState() => _TrashScreenState();
}

class _TrashScreenState extends State<TrashScreen> {
  @override
  Widget build(BuildContext context) {
    log("=============${NotesData.trashList.length}===");
    return Scaffold(
      appBar: AppBar(title: Text("Trash")),
      body: ListView.builder(
        itemCount: NotesData.trashList.length,
        itemBuilder: (context, i) {
          return InkWell(
            onDoubleTap: (){
              NotesData.list.add(NotesData.trashList[i]);
              NotesData.trashList.removeAt(i);
              setState(() {});
            },
            child: Card(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  spacing: 20,
                  children: [
                    Expanded(
                      child: Column(
                        spacing: 5,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            spacing: 10,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                  "${NotesData.trashList[i]['title']}",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                                ),
                              ),
                              Text("${NotesData.trashList[i]['created_at']}", style: TextStyle(fontSize: 12)),
                            ],
                          ),
                          Text("${NotesData.trashList[i]['details']}", maxLines: 2, style: TextStyle(fontSize: 14)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
