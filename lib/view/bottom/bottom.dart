import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:note_app/view/folder/folder.dart';
import 'package:note_app/view/settings/settings.dart';
import 'package:note_app/view/trash/trash.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../note/note.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List screens = [NoteScreen(), FolderScreen(), TrashScreen(), SettingsScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (v) {
          log("========V : $v");
          setState(() {
            selectedIndex = v;
          });
        },
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: TextStyle(color: Colors.black),
        unselectedLabelStyle: TextStyle(color: Colors.black),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.note_add_outlined), label: "Note"),
          BottomNavigationBarItem(icon: Icon(Icons.folder_copy), label: "Folder"),
          BottomNavigationBarItem(icon: Icon(Icons.delete_forever_sharp), label: "Trash"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
        ],
      ),
    );
  }
}
