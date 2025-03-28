import 'package:flutter/material.dart';
import 'package:b3_dev/views/main_home.dart';
import 'package:b3_dev/views/about.dart';
import 'package:b3_dev/views/contact.dart';
import 'package:b3_dev/views/articles.dart';
import 'package:adaptive_theme/adaptive_theme.dart';

/* Il est le menu qui s'affiche lorsque l'on clique sur le menu burger, il ne possède pas de paramètres */

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  bool darkmode = false;

  @override

  /* La gestion du thème sombre utilise le package "adaptive_theme"
  Documentation => https://pub.dev/packages/adaptive_theme */

  /* initState est la fonction qui initialise le thème sombre ou clair en fonction de celui défini par défaut */
  void initState() {
    super.initState();
    _loadTheme();
  }

  /* _loadTheme est la fonction qui va charger et appliquer le thème initalisé précédemment */
  void _loadTheme() async {
    final savedThemeMode = await AdaptiveTheme.getThemeMode();
    setState(() {
      darkmode = savedThemeMode == AdaptiveThemeMode.dark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      /* Ce width permet de déterminer la taille global du drawer enfonction de la taille de l'écran */
      width: MediaQuery.of(context).size.width * 0.7,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            /* Style lié à la partie haute du drawer */
            decoration: BoxDecoration(color: Color.fromARGB(255, 32, 32, 32)),
            child: Center(
              child: Text(
              /* Titre du drawer */
                'Super Titre de mon application',
                style: TextStyle(
                  color: Color.fromARGB(255, 198, 156, 109),
                  fontSize: 24,
                ),
              ),
            ),
          ),

          /* Les différents boutons qui cliquable, paramètre principaux :
          
          • leading: Widget qui sera devant le label du bouton, généralement un icon
          • title: Widget qui représentera le label
          • onTap: (){} -> Contient la logique lorsque l'on appuie/clique sur le label 
          
          */

          /* Bouton pour accéder à la page d'Accueil */
          ListTile(
            leading: const Icon(Icons.home, color: Colors.white),
            title: const Text(
              'Accueil',
              style: TextStyle(color: Color.fromARGB(255, 198, 156, 109), fontSize: 24),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => const MainHome()));
            },
          ),
          /* Bouton pour accéder à la page À Propos */
          ListTile(
            leading: const Icon(Icons.info, color: Colors.white),
            title: const Text(
              'À Propos',
              style: TextStyle(color: Color.fromARGB(255, 198, 156, 109), fontSize: 24),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => const PageAbout()));
            },
          ),
          /* Bouton pour accéder à la page Contact */
          ListTile(
            leading: const Icon(Icons.message, color: Colors.white),
            title: const Text(
              'Contact',
              style: TextStyle(color: Color.fromARGB(255, 198, 156, 109), fontSize: 24),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => const PageContact()));
            },
          ),

          /* Seconde partie du menu */
          const Divider(),

          /* Bouton pour accéder à la page des articles */
          ListTile(
            leading: const Icon(Icons.edit, color: Colors.white),
            title: const Text(
              'Articles',
              style: TextStyle(color: Color.fromARGB(255, 198, 156, 109), fontSize: 24),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => const PageArticles()));
            },
          ),
          /* Bouton pour gérer le dark mode */
          SwitchListTile(
            title: const Text(
              'Mode Sombre',
              style: TextStyle(color: Color.fromARGB(255, 198, 156, 109), fontSize: 24)
            ),
            value: darkmode,
            onChanged: (bool value) {
              /* Logique : 
              darkmode vérifie dans quelle si le thème est en darkmode ou non, si il l'est, on passe en
              light theme, sinon on passe en dark theme */
              setState(() {
                darkmode = value;
              });

              if (value) {
                AdaptiveTheme.of(context).setDark();
              } else {
                AdaptiveTheme.of(context).setLight();
              }
            },
          ),
        ],
      ),
    );
  }
}