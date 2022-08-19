import 'package:flutter/material.dart';
import 'homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nature Sounds',
      //theme: ThemeData.dark(),
      theme: ThemeData(
        brightness: Brightness.dark,
        iconTheme: const IconThemeData(size: 36.0, color: Colors.amber),
      ),

      home: Scaffold(
        appBar: AppBar(
          title: const Text('Nature sounds'),
          centerTitle: true,
        ),
        body: const HomePage(),
      ),
    );
  }
}
