import 'package:flutter/material.dart';
import 'package:b3_dev/views/drawer.dart';

class MainHome extends StatelessWidget {
  const MainHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
      builder: (context) {
        return IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        );
      },
    ),
        title: const Text('Main Home'),
      ),
      drawer: const MyDrawer(),
    );
  }
}
