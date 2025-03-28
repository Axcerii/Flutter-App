import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';

import 'package:file_saver/file_saver.dart';


/* Il s'agit du formulaire de base utilisé par la page contact (views/contact.dart)
Il utilise le pub/package file_saver, voici la documentation => https://pub.dev/packages/file_saver
*/

class MyContactForm extends StatefulWidget {
  const MyContactForm({super.key});

  @override
  MyContactFormState createState() {
    return MyContactFormState();
  }
}
class MyContactFormState extends State<MyContactForm> {

  /* On créer une clé unique qui permettra d'identifiant lors de la validation du formulaire */
  final _formKey = GlobalKey<FormState>();

  /* On initialise les variables du formulaire */
  String? _name;
  String? _email;
  String? _message;


  /* downloadJson() est la fonction qui va générer le téléchargement du fichier JSON contenant les informations du formulaire */
  Future<void> downloadJson(String? name, String? email, String? message) async {
    Map<String, dynamic> data = {
      'name': name,
      'email': email,
      'message': message,
    };

    /* On converti en JSON à l'aide du package dart:convert & dart:typed_data pour gérer l'UTF8 */
    String jsonString = jsonEncode(data);
    Uint8List bytes = Uint8List.fromList(utf8.encode(jsonString));

    /* On enregistre les informations convertis grace à saveFile */
    await FileSaver.instance.saveFile(
      name: "contact_data",
      bytes: bytes,
      ext: "json",
      mimeType: MimeType.json,
    );
  }


  @override
  Widget build(BuildContext context) {
    /* On créer alors notre vue du formulaire */
    return 
    /* On le centre */
    Center(child:
    /* On change sa taille */
    SizedBox(
      width: MediaQuery.of(context).size.width * 0.5,

      child:
      /* Formulaire */
      Form(
        /* La key est la clé unique créer plus haut */
      key: _formKey,
      child: Column(
        /* On gère chaque élément de notre formulaire */
        children: [
          /* On gère le champ du nom */
        TextFormField(
          decoration: const InputDecoration(
            icon: Icon(Icons.person),
            /* Text afficher quand on clique sur la zone de texte */
            hintText: 'Écris moi donc ton blaze',
            labelText: 'Nom',
          ),
          /* On créer une logique pour valider le formulaire, une sorte de Regex */
           onSaved: (String? value) {
              /* Logique :
              Si la valeur est null, on le remplace par une string vide
              */
              _name = value ?? '';
            },
          validator: (String? value) {
            return (value != null && value.contains('@')) ? 'Le arobase est proscrit.' : null;
          },
        ),
        /* On gère le champ pour le mail */
        TextFormField(
          decoration: const InputDecoration(
            icon: Icon(Icons.mail),
            hintText: 'Ajoute à cela, ton adresse mail stp.',
            labelText: 'E-mail',
          ),
          onSaved: (String? value) {
            /* Logique :
              Si la valeur est null, on le remplace par une string vide
            */
              _email = value ?? '';
          },
        ),
        /* On gère le champ pour le message à envoyer */
        TextFormField(
          decoration: InputDecoration(
            icon: Icon(Icons.edit),
            hintText: 'Que veux-tu nous dire de beau ?',
            labelText: 'Description',
          ),
          onSaved: (String? value){
            /* Logique :
              Si la valeur est null, on le remplace par une string vide
            */
              _message = value ?? '';
          },
        ),

        /* Ici on gère le bouton submit */
        ElevatedButton(
         onPressed: () {
          /* On vérifie si le formulaire est valide */
          if (_formKey.currentState!.validate()) {
            /* Si oui, on sauvegarde les données le temps d'appliquer notre logique */
            _formKey.currentState!.save();

            /* 
              On utilise notre fonction initialiser au début du fichier
             */
            downloadJson(_name, _email, _message);

            /* On envoie notre SnackBar (il faudrait vérifier si ça a vraiment marché avant, mais ce n'est pas encore fait) */
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Données enregistrées et fichier téléchargé !')),
            );
          }
         },
         /* On applique le texte sur notre bouton */
          child: const Text('Envoyer')),
        ],
      ),
    )
    )
    );
  }
}