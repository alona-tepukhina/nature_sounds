import 'package:audioplayers/audioplayers.dart';

class SoundPlayer {
  SoundPlayer({required this.soundName, required this.fileName});

  final String soundName;
  final String fileName;
  double volume = 0.5;

  final player = AudioPlayer();

  void playSound(String fileName) async {
    await player.setReleaseMode(ReleaseMode.loop);
    await player.play(AssetSource(fileName), volume: volume);
  }

  void stopSound() async {
    await player.stop();
  }

  void pauseSound() async {
    await player.pause();
  }

  void resumeSound() async {
    await player.resume();
  }
}
