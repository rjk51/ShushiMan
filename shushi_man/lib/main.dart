import 'package:flutter/material.dart';
import 'pages/intro_page.dart';
import 'pages/menu_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const IntroPage(),
      routes: {
        '/intro': (context) => const IntroPage(),
        '/menupage': (context) => const MenuPage(),
      },
    );
  }
}
