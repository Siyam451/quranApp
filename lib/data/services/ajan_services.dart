import 'package:audioplayers/audioplayers.dart';

class AzanService {

  static final AudioPlayer _player =
  AudioPlayer();

  static Future<void> playAzan() async {

    await _player.play(
      AssetSource(
        "audio/azan1.mp3",
      ),
    );
  }
}