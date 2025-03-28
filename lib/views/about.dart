import 'package:flutter/material.dart';
import 'package:b3_dev/views/layout.dart';
  
  
/* Page simple */

class PageAbout extends StatelessWidget {
  const PageAbout({super.key});


  @override
  Widget build(BuildContext context) {
    return Layout(
      title: "À Propos",
      child: 
      Column(
        /* Texte de présentation */
        children: [
          const Text('nqrse, lu sous le nom de Naruse, est un rappeur, auteur-compositeur et chanteur japonais de la préfecture de Nagasaki.'),
         /* Image, le dossier contenant les images est à la racine dans assets/images
         Pour avoir un autre chemin, il faut modifier le pubspec.yaml à la racine du projet */
          SizedBox(
            child: Image.asset('images/PP_Dango.jpg')
            ),
          ],
      )
    );
  }
}