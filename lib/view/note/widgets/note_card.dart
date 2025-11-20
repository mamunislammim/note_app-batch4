import 'dart:developer';

import 'package:flutter/material.dart';
import '../../../database/notes.dart';

class NoteCardWidget extends StatelessWidget {
  const NoteCardWidget({super.key, required this.i, required this.onTap});

  final int i;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
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
                          "${NotesData.list[i]['title']}",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                      ),
                      Text("${NotesData.list[i]['created_at']}", style: TextStyle(fontSize: 12)),
                    ],
                  ),
                  Text("${NotesData.list[i]['details']}", maxLines: 2, style: TextStyle(fontSize: 14)),
                ],
              ),
            ),
            InkWell(
              onTap: onTap,
              child: Icon(Icons.delete_forever_sharp, color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
