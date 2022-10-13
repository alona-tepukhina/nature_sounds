import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'sound_card.dart';
import 'package:audioplayers/audioplayers.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  //static List<AudioPlayer> players = [];
  static List<AudioPlayer> playersNow = [];

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  IconData playStopIcon = FontAwesomeIcons.pause;
  String playStopAllText = 'Pause all';

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        ListView(
          scrollDirection: Axis.vertical,
          children: [
            const SizedBox(height: 4.0),
            SoundCard(
              player: AudioPlayer(),
              soundName: 'Heavy Rain',
              fileName: '527498__timothyd4y__rain-on-sidewalk.wav',
              soundIconData: FontAwesomeIcons.cloudShowersHeavy,
            ),
            SoundCard(
              player: AudioPlayer(),
              soundName: 'Cat 1 purr',
              fileName: '561176__philsapphire__cat-purr.wav',
              soundIconData: FontAwesomeIcons.cat,
            ),
            SoundCard(
              player: AudioPlayer(),
              soundName: 'Cat 2 purr',
              fileName: '624162__atakantrcn__purr.wav',
              soundIconData: FontAwesomeIcons.cat,
            ),
            SoundCard(
              player: AudioPlayer(),
              soundName: 'Canary',
              fileName: '85401__readeonly__canaryartie-1.wav',
              soundIconData: FontAwesomeIcons.dove,
            ),
            SoundCard(
              player: AudioPlayer(),
              soundName: 'River',
              fileName: '459406__pfannkuchn__small-river-1-fast-distant.wav',
              soundIconData: FontAwesomeIcons.water,
            ),
            SoundCard(
              player: AudioPlayer(),
              soundName: 'Train',
              fileName: '202341__eriaperse__ter-court.mp3',
              soundIconData: FontAwesomeIcons.train,
            ),
            const SizedBox(height: 92),
          ],
        ),
        Card(
          color: Colors.blue,
          margin: const EdgeInsets.only(bottom: 16),
          elevation: 24,
          child: SizedBox(
            width: 240,
            height: 64,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 24, right: 32),
                  child: Text(
                    playStopAllText,
                    style: const TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      if (HomePage.playersNow.any((player) =>
                              player.state == PlayerState.playing) ==
                          true) {
                        for (var player in HomePage.playersNow) {
                          if (player.state == PlayerState.playing) {
                            player.pause();
                          }
                        }
                        playStopIcon = FontAwesomeIcons.play;
                        playStopAllText = 'Resume all';
                      } else {
                        for (var player in HomePage.playersNow) {
                          player.resume();
                        }
                        playStopIcon = FontAwesomeIcons.pause;
                        playStopAllText = 'Pause all';
                      }
                    });
                  },
                  icon: Icon(
                    playStopIcon,
                    size: 24,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
