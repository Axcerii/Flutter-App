import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context){
    return ListView(
      padding: EdgeInsets.zero,
      children:[
        const DrawerHeader(
        decoration: BoxDecoration(color: Colors.blue),
        child: Text('Drawer Header'),
      ),
     ListTile(
        title: const Text('Item 1'),
        onTap:() {
          Navigator.pop(context);
        },
      ),
      ListTile(
        title: Text('Item 2'),
        onTap:() {
          Navigator.pop(context);
        }
      ),
    ]
    );
  }
}