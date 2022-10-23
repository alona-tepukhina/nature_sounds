import 'package:flutter/material.dart';
import 'package:nature_sounds/play_stop_provider.dart';
import 'package:provider/provider.dart';
import 'homepage.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => PlayStopProvider(),
    child: const MyApp(),
  ));
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
          title: const Text('Calming sounds'),
          centerTitle: true,
        ),
        body: const HomePage(),
      ),
    );
  }
}
