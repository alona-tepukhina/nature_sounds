import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
  double currentSliderValue = 0.5;

  final AudioCache cache = AudioCache();
  final player = AudioPlayer();
  // final player = AudioPlayer(playerId: 'my_unique_playerId');

  void playSound(String fileName) async {
    await player.setReleaseMode(ReleaseMode.loop);
    await player.play(AssetSource(fileName), volume: currentSliderValue);
  }

  void stopSound() async {
    await player.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Card(
                color: Colors.grey.shade800,
                margin:
                    const EdgeInsets.symmetric(vertical: 4.0, horizontal: 2.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      FontAwesomeIcons.cloudRain,
                      size: 36.0,
                      color: Colors.amber,
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            const Text(
                              'Rain',
                              style: TextStyle(
                                  fontSize: 24.0, color: Colors.amber),
                            ),
                            Slider(
                                value: currentSliderValue,
                                min: 0,
                                max: 1,
                                onChanged: (double newValue) {
                                  setState(() {
                                    currentSliderValue = newValue;
                                    player.setVolume(newValue);
                                  });
                                }),
                          ],
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () {
                        playSound('rain.wav');
                      },
                      icon: const Icon(
                        FontAwesomeIcons.play,
                        size: 24.0,
                        color: Colors.amber,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        stopSound();
                      },
                      icon: const Icon(
                        FontAwesomeIcons.stop,
                        size: 24.0,
                        color: Colors.amber,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
