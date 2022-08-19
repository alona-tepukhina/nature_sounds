import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'sound_card.dart';
import 'package:audioplayers/audioplayers.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        ListView(
          scrollDirection: Axis.vertical,
          children: const [
            SizedBox(height: 4.0),
            SoundCard(
              soundName: 'Heavy Rain',
              fileName: '527498__timothyd4y__rain-on-sidewalk.wav',
              soundIconData: FontAwesomeIcons.cloudShowersHeavy,
            ),
            SoundCard(
              soundName: 'Heavy Rain with Thunder',
              fileName: '164206__danjocross__rain-very-heavy-with-thunder.wav',
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
            SoundCard(
              soundName: 'Canary',
              fileName: '85401__readeonly__canaryartie-1.wav',
              soundIconData: FontAwesomeIcons.dove,
            ),
            SoundCard(
              soundName: 'River',
              fileName: '459406__pfannkuchn__small-river-1-fast-distant.wav',
              soundIconData: FontAwesomeIcons.water,
            ),
            SoundCard(
              soundName: 'Train',
              fileName: '202341__eriaperse__ter-court.mp3',
              soundIconData: FontAwesomeIcons.train,
            ),
          ],
        ),
        Visibility(
          visible: false,
          child: SizedBox(
            width: 200,
            height: 60,
            child: Card(
              color: Colors.blueGrey.shade600,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('Stop all'),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(FontAwesomeIcons.stop),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
