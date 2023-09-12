import 'package:flutter/material.dart';
import 'package:hyrule_artigo/presenter/categories.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hyrule Artigo',
      theme: ThemeData(
         useMaterial3: true,
        brightness: Brightness.dark,
        colorSchemeSeed: Colors.blue,
      ),
      home: const Categories()
    );
  }
}
