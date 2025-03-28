import 'package:flutter/material.dart';
import 'package:b3_dev/views/layout.dart';


//Main page, il s'agit juste du squelette de base du projet
class MainHome extends StatelessWidget {

  const MainHome({super.key});

  @override
  Widget build(BuildContext context) {
    //On appelle le layout (barre de navigation + le menu déroulant) ->views/layout.dart
    return const Layout(
      title: "Accueil",
      child: Column(children: [
        Text('Ma super page home'),
      ]) 
    );
  }
}
