import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:nature_sounds/homepage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nature_sounds/play_stop_provider.dart';
import 'package:provider/provider.dart';

class SoundCard extends StatefulWidget {
  SoundCard({
    Key? key,
    required this.player,
    this.soundIconData = FontAwesomeIcons.itunesNote,
    required this.soundName,
    required this.fileName,
  }) : super(key: key) {
    player.setReleaseMode(ReleaseMode.loop);
  }

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

  bool isPlayed = false;
  Color? cardColor = SoundCard.inactiveCardColor;

  void playStop() async {
    //isPlayed = !isPlayed;

    if (widget.player.state == PlayerState.playing) {
      //if (isPlayed = true) {
      cardColor = SoundCard.inactiveCardColor;
      isPlayed = false;
      await widget.player.pause();
      context.read<PlayStopProvider>().togglePlayMultiple(false);

      HomePage.playersNowCards.remove(widget);
    } else {
      cardColor = SoundCard.activeCardColor;
      isPlayed = true;
      await widget.player
          .play(AssetSource(widget.fileName), volume: currentVolume);

      HomePage.playersNowCards.add(widget);
      context.read<PlayStopProvider>().togglePlayMultiple(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    // widget.player.setReleaseMode(ReleaseMode.loop);

    return GestureDetector(
      onTap: () {
        setState(() {
          playStop();
        });
      },
      child: Card(
        color: cardColor,
        //margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 4.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  widget.soundIconData,
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  widget.soundName,
                  style: const TextStyle(fontSize: 16.0, color: Colors.amber),
                ),
                const SizedBox(
                  height: 12,
                ),
                Visibility(
                  //visible: false,
                  visible: isPlayed,
                  child: Slider(
                    value: currentVolume,
                    min: 0,
                    max: 1,
                    onChanged: (double newValue) {
                      setState(() {
                        currentVolume = newValue;
                        widget.player.setVolume(newValue);
                      });
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
