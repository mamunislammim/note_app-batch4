import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:note_app/view/trash/trash.dart';
import '../note/note.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int selectedIndex = 0;
  List screens = [NoteScreen(), TrashScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (v) {
          log("========V : $v");
          selectedIndex = v;
          setState(() {});
        },
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: TextStyle(color: Colors.black),
        unselectedLabelStyle: TextStyle(color: Colors.black),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.note_add_outlined), label: "Note"),
          BottomNavigationBarItem(icon: Icon(Icons.delete_forever_sharp), label: "Trash"),
        ],
      ),
    );
  }
}
