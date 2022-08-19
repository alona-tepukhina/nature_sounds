import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SoundCard extends StatefulWidget {
  const SoundCard({
    Key? key,
    this.soundIconData = FontAwesomeIcons.itunesNote,
    required this.soundName,
    required this.fileName,
  }) : super(key: key);

  final String soundName;
  final String fileName;
  final IconData soundIconData;

  static final Color? inactiveCardColor = Colors.grey[800];
  static final Color? activeCardColor = Colors.blueGrey[800];

  //static int playerId = 0;

  @override
  State<SoundCard> createState() => _SoundCardState();
}

class _SoundCardState extends State<SoundCard> {
  double currentVolume = 0.5;
  IconData playStopIcon = FontAwesomeIcons.play;
  bool isPlayed = false;
  Color? cardColor = SoundCard.inactiveCardColor;
  //bool sliderVisibility = false;

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
    return SizedBox(
      height: 100,
      child: Card(
        color: cardColor,
        margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              widget.soundIconData,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      widget.soundName,
                      style:
                          const TextStyle(fontSize: 16.0, color: Colors.amber),
                    ),
                    Slider(
                      value: currentVolume,
                      min: 0,
                      max: 1,
                      onChanged: (double newValue) {
                        setState(() {
                          currentVolume = newValue;
                          player.setVolume(newValue);
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  if (isPlayed == false) {
                    playStopIcon = FontAwesomeIcons.pause;
                    playSound(widget.fileName);
                    cardColor = SoundCard.activeCardColor;
                    isPlayed = true;
                  } else {
                    playStopIcon = FontAwesomeIcons.play;
                    stopSound();
                    cardColor = SoundCard.inactiveCardColor;
                    isPlayed = false;
                  }
                });
              },
              icon: Icon(
                playStopIcon,
                size: 32.0,
                // color: Colors.amber,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
