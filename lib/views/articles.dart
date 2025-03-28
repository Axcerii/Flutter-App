import 'package:flutter/material.dart';
import 'package:b3_dev/views/layout.dart';
import 'package:b3_dev/views/article_details.dart';
import 'package:b3_dev/controllers/fetchArticles.dart';
import 'package:b3_dev/models/article.dart';

/* Il s'agit d'une page qui affiche l'intégralité des articles récupérer via une API

Le model se trouve dans lib/models/article.dart
Le controller et la fonction dans lib/controllers/fetchArticles.php 

L'URL de l'API se trouve dans le fichier lib/controllers/fetchArticles.php */


class PageArticles extends StatelessWidget {
  const PageArticles({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(
      title: "Articles",
      child: FutureBuilder<List<Article>>(
        future: fetchArticles(),
        builder: (context, snapshot){
            /* Si la connexion est en attente, afficher un cercle de loading */           
            if (snapshot.connectionState == ConnectionState.waiting){
              return const Center(child: CircularProgressIndicator());
           }
           /* Si la connexion echoue, afficher le message d'erreur lié */
           else if (snapshot.hasError){
             return Center(child: Text('Erreur du chargement : ${snapshot.error}'));
           }
           /* Si la connexion réussi, afficher les articles */
           else if (snapshot.hasData){
              return ListView.builder(
                /* itemCount = Nombre d'Article récupéré */
                itemCount: snapshot.data!.length,
                /* itemBuilder = C'est le paramètre qui va prendre un article d'exemple */
                itemBuilder: (context, index) {
                  
                  Article article = snapshot.data![index];
                  return ListTile(
                    title: Text(article.title),
                    subtitle: Text(article.body),
                    onTap:() {
                      Navigator.push(context,
                      MaterialPageRoute(builder: (context)=> PageArticle(id: article.id))
                      );
                    },
                  );

                },
              );
           }
           /* Dans le cas ou la connexion est perdu sans erreur ou l'ID donné n'existe pas */
           else{
            return const Center(child:Text('Erreur : Articles non existant'));
           }
        }
      )
    );
  }
}