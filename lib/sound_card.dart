import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SoundCard extends StatefulWidget {
  const SoundCard({
    Key? key,
    required this.player,
    this.soundIconData = FontAwesomeIcons.itunesNote,
    required this.soundName,
    required this.fileName,
  }) : super(key: key);

  final String soundName;
  final String fileName;
  final IconData soundIconData;
  final AudioPlayer player;

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

  void playStop() async {
    if (widget.player.state == PlayerState.stopped) {
      cardColor = SoundCard.activeCardColor;
      playStopIcon = FontAwesomeIcons.pause;
      await widget.player
          .play(AssetSource(widget.fileName), volume: currentVolume);
    } else if (widget.player.state == PlayerState.playing) {
      //isPlayed = false;
      playStopIcon = FontAwesomeIcons.play;
      cardColor = SoundCard.inactiveCardColor;
      await widget.player.stop();
    }
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
                          widget.player.setVolume(newValue);

                          // if (newValue > 0.1) {
                          //   playStop();
                          // }
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
                  playStop();
                });
              },
              icon: Icon(
                playStopIcon,
                size: 32.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
