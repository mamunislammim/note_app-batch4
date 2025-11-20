

import 'package:flutter/material.dart';

import '../../../database/notes.dart';

class DeleteDialogue extends StatelessWidget {
  const DeleteDialogue({super.key, required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Confirmation"),
      content: Text("Are you delete this Item?"),
      actions: [
        InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Text("Cancel"),
        ),
        InkWell(
          onTap: onTap,
          child: Text("Delete"),
        ),
      ],
    );
  }
}
