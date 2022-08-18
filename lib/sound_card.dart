import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SoundCard extends StatefulWidget {
  SoundCard({
    Key? key,
    this.soundIconData = FontAwesomeIcons.itunesNote,
    required this.soundName,
    required this.fileName,
  }) : super(key: key) {}

  final String soundName;
  final String fileName;
  final IconData soundIconData;

  //static int playerId = 0;

  @override
  State<SoundCard> createState() => _SoundCardState();
}

class _SoundCardState extends State<SoundCard> {
  double currentVolume = 0.5;

  final player = AudioPlayer();

  void playSound(String fileName) async {
    await player.setReleaseMode(ReleaseMode.loop);

    await player.play(AssetSource(fileName), volume: currentVolume);
  }

  void stopSound() async {
    await player.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey.shade800,
      margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 2.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            widget.soundIconData,
            size: 36.0,
            color: Colors.amber,
          ),
          Column(
            children: [
              Column(
                children: [
                  Text(
                    widget.soundName,
                    style: const TextStyle(fontSize: 18.0, color: Colors.amber),
                  ),
                  Slider(
                      value: currentVolume,
                      //value: 0.5,
                      min: 0,
                      max: 1,
                      onChanged: (double newValue) {
                        setState(() {
                          currentVolume = newValue;
                          player.setVolume(newValue);
                        });
                      }),
                ],
              ),
            ],
          ),
          IconButton(
            onPressed: () {
              playSound(widget.fileName);
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
    );
  }
}
