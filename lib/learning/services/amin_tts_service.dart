import 'package:flutter_tts/flutter_tts.dart';

class AminTtsService {
  AminTtsService._();

  static final AminTtsService instance = AminTtsService._();

  final FlutterTts _tts = FlutterTts();
  bool _initialized = false;

  Future<void> init() async {
    if (_initialized) {
      return;
    }
    await _tts.setLanguage('ms-MY');
    await _tts.setSpeechRate(0.45);
    await _tts.setPitch(1.0);
    await _tts.awaitSpeakCompletion(true);
    _initialized = true;
  }

  Future<void> speak(String text) async {
    if (text.trim().isEmpty) {
      return;
    }
    await init();
    await _tts.stop();
    await _tts.speak(text);
  }

  Future<void> speakPair(String first, String second) async {
    if (first.trim().isEmpty || second.trim().isEmpty) {
      return;
    }
    await init();
    await _tts.stop();
    await _tts.speak(first);
    await Future<void>.delayed(const Duration(milliseconds: 320));
    await _tts.speak(second);
  }

  Future<void> stop() => _tts.stop();
}
