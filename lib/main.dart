import 'package:flutter/material.dart';
import 'views/main_home.dart' ;
import 'package:adaptive_theme/adaptive_theme.dart';


void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorSchemeSeed: Color.fromARGB(255, 109, 198, 179),
      ),
      dark: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorSchemeSeed: Color.fromARGB(255, 198, 156, 109),
      ),
      
      initial: AdaptiveThemeMode.light,
      builder: (theme, darkTheme) => MaterialApp(
      title: 'App B3 MDS',
      theme: theme,
      debugShowCheckedModeBanner: false, 
      home: const MainHome(),
    ) 
    );
  }
}
