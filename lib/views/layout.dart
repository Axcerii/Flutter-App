import 'package:flutter/material.dart';
import 'package:b3_dev/views/drawer.dart';

/* Le layout est le widget qui représente la navbar & le sous menu burger
   
   Il prend deux paramètres obligatoires :

   • title : Représente le titre qui sera afficher dans la navbar
   • child : Contient le reste de la page
 */

class Layout extends StatelessWidget {

  final Widget child;
  final String title;

  const Layout({super.key, required this.child, required this.title});


  @override
  Widget build(BuildContext context) {
    return Scaffold(

/* Début de la app bar */

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
        title: Text(title),
      ),

    /* Appelle du Drawer (Menu glissant) depuis views/drawer.dart */
  
      drawer: MyDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),

        /* child represente le contenu de la page qui va suivre  */

        child: child,
      )
    );
  }
}
