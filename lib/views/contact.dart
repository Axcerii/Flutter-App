import 'package:flutter/material.dart';
import 'package:b3_dev/views/layout.dart';
import 'package:b3_dev/views/formContact.dart';

/* Il s'agit de la page de contact, le formulaire est inclut dedans avec un widget pour faciliter l'ajout d'autre props */
/* Le widgets pour le formulaire se trouve dans views/formContact.dart */
class PageContact extends StatelessWidget {
  const PageContact({super.key});

  @override

  Widget build(BuildContext context) {
    /* Ajout du widget de Layout */
    return const Layout(
      title: "Contact",
      child: Column(children:[
      /* Ajout du widget de formulaire */
        MyContactForm(),
      ])
    );
  }
}