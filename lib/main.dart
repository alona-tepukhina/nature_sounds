import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'sound_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nature Sounds',
      theme: ThemeData.dark(),
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

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              SoundCard(
                soundName: 'Heavy Rain',
                fileName: '527498__timothyd4y__rain-on-sidewalk.wav',
                soundIconData: FontAwesomeIcons.cloudShowersHeavy,
              ),
              SoundCard(
                soundName: 'Heavy Rain with Thunder',
                fileName:
                    '164206__danjocross__rain-very-heavy-with-thunder.wav',
                soundIconData: FontAwesomeIcons.cloudBolt,
              ),
              SoundCard(
                soundName: 'High wind',
                fileName: '559094__vital-sounds__high-wind-2.wav',
                soundIconData: FontAwesomeIcons.wind,
              ),
              SoundCard(
                soundName: 'Cat 1 purr',
                fileName: '561176__philsapphire__cat-purr.wav',
                soundIconData: FontAwesomeIcons.cat,
              ),
              SoundCard(
                soundName: 'Cat 2 purr',
                fileName: '624162__atakantrcn__purr.wav',
                soundIconData: FontAwesomeIcons.cat,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
