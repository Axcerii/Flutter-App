import 'package:flutter/material.dart';
import 'package:b3_dev/views/layout.dart';
import 'package:b3_dev/models/article.dart';
import 'package:b3_dev/controllers/fetchArticles.dart';

/* Il s'agit de la page qui affiche un seul article en fonction de son id
Le model se trouve dans lib/models/article.dart
Le controller et la fonction dans lib/controllers/fetchArticles.php 
*/

class PageArticle extends StatelessWidget {

  final int id;
  
  const PageArticle({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Layout(
      title: "Article",
      child: FutureBuilder<Article>(
        /* On récupère notre Article en fonction de son ID */
        future: fetchArticleById(id),
        builder: (context, snapshot){
          /* Si la connexion est en attente, on affiche un petit icone de loading */
          if (snapshot.connectionState == ConnectionState.waiting){
              return const Center(child: CircularProgressIndicator());
           }
          /* Si la connexion échoue, on affiche l'erreur lié à cela */
          else if (snapshot.hasError){
             return Center(child: Text('Erreur du chargement : ${snapshot.error}'));
           }
           /* Si la connexion réussi on récupère l'article et on l'affiche */
          else if (snapshot.hasData){
            Article article = snapshot.data!;
            /* Structure de l'article, le style est à modifier ici */
            return Center(child: 
              Column(
                children: [
                  Text(article.title, style: const TextStyle(fontWeight: FontWeight.bold)),
                  Text(article.body)
                ],
              )
            );
          }
          /* Dans le cas ou la connexion est perdu sans erreur ou l'ID donné n'existe pas */
          else{
            return const Center(child:Text('Erreur : 404, ID Inconnu'));
           }

        }
      )
    );
  }
}