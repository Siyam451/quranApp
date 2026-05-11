import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class AudioProvider extends ChangeNotifier {
  final AudioPlayer _player = AudioPlayer();

  bool _isPlaying = false;
  bool get isPlaying => _isPlaying;

  String? _currentUrl;

  Future<void> playAudio(String url) async {
    try {
      if (_currentUrl == url && _isPlaying) {
        await _player.pause();
        _isPlaying = false;
      } else {
        await _player.stop();
        await _player.play(UrlSource(url));
        _isPlaying = true;
        _currentUrl = url;
      }

      notifyListeners();
    } catch (e) {
      debugPrint("Audio Error: $e");
    }
  }
}