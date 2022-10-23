import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nature_sounds/play_stop_provider.dart';
import 'sound_card.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  //static List<AudioPlayer> playersNow = [];
  static List<SoundCard> playersNowCards = [];

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  IconData? playStopIcon;
  String? playStopAllText;

  @override
  void initState() {
    playStopIcon = FontAwesomeIcons.snowflake;
    playStopAllText = 'Select sounds';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          GridView.count(
            crossAxisCount: 2,
            children: [
              SoundCard(
                player: AudioPlayer(),
                soundName: 'Heavy Rain',
                fileName: '527498__timothyd4y__rain-on-sidewalk.wav',
                soundIconData: FontAwesomeIcons.cloudShowersHeavy,
              ),
              SoundCard(
                player: AudioPlayer(),
                soundName: 'River',
                fileName: '459406__pfannkuchn__small-river-1-fast-distant.wav',
                soundIconData: FontAwesomeIcons.water,
              ),
              // SoundCard(
              //   player: AudioPlayer(),
              //   soundName: 'Cat 1 purr',
              //   fileName: '561176__philsapphire__cat-purr.wav',
              //   soundIconData: FontAwesomeIcons.cat,
              // ),
              // SoundCard(
              //   player: AudioPlayer(),
              //   soundName: 'Cat 2 purr',
              //   fileName: '624162__atakantrcn__purr.wav',
              //   soundIconData: FontAwesomeIcons.cat,
              // ),
              SoundCard(
                player: AudioPlayer(),
                soundName: 'Canary',
                fileName: '85401__readeonly__canaryartie-1.wav',
                soundIconData: FontAwesomeIcons.dove,
              ),
              SoundCard(
                player: AudioPlayer(),
                soundName: 'Train',
                fileName: '202341__eriaperse__ter-court.mp3',
                soundIconData: FontAwesomeIcons.train,
              ),
            ],
          ),
          Card(
            color: Colors.blue,
            margin: const EdgeInsets.only(bottom: 16),
            elevation: 24,
            child: SizedBox(
              width: 240,
              height: 64,
              child: Consumer<PlayStopProvider>(
                builder: (context, model, child) {
                  bool isPlayed = model.isPlayedMultiple;
                  playStopAllText = isPlayed ? 'Pause all' : 'Resume all';
                  playStopIcon =
                      isPlayed ? FontAwesomeIcons.pause : FontAwesomeIcons.play;

                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 24, right: 32),
                        child: Text(
                          playStopAllText!,
                          style: const TextStyle(fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          if (context
                              .read<PlayStopProvider>()
                              .isPlayedMultiple) {
                            for (var card in HomePage.playersNowCards) {
                              if (card.player.state == PlayerState.playing) {
                                card.player.pause();
                                Provider.of<PlayStopProvider>(context,
                                        listen: false)
                                    .togglePlayMultiple(false);
                              }
                            }

                            //playStopAllText = 'Pause all';
                          } else {
                            for (var card in HomePage.playersNowCards) {
                              card.player.resume();
                              Provider.of<PlayStopProvider>(context,
                                      listen: false)
                                  .togglePlayMultiple(true);
                            }
                          }

                          //setState(() {
                          // if (HomePage.playersNow.any((player) =>
                          // player.state == PlayerState.playing) ==
                          //     true) {
                          //   for (var player in HomePage.playersNow) {
                          //     if (player.state == PlayerState.playing) {
                          //       player.pause();
                          //     }
                          //   }
                          //   playStopIcon = FontAwesomeIcons.play;
                          //   playStopAllText = 'Resume all';
                          // } else {
                          //   for (var player in HomePage.playersNow) {
                          //     player.resume();
                          //   }
                          //   playStopIcon = FontAwesomeIcons.pause;
                          //   playStopAllText = 'Pause all';
                          // }
                        },
                        icon: Icon(
                          playStopIcon,
                          size: 24,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
