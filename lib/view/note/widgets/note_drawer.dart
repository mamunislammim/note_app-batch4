import 'package:flutter/material.dart';


class NoteDrawer extends StatelessWidget {
  const NoteDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(child: Icon(Icons.draw)),
          Column(
            children: [
              ListTile(title: Text("Home",style: TextStyle(color: Colors.red),)),
              ListTile(title: Text("Home",style: TextStyle(color: Colors.red),)),
              ListTile(title: Text("Home",style: TextStyle(color: Colors.red),)),
              ListTile(title: Text("Home",style: TextStyle(color: Colors.red),)),
              ListTile(title: Text("Home",style: TextStyle(color: Colors.red),)),

            ],
          ),
        ],
      ),
    );
  }
}
