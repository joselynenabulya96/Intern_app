import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:text_translator/views/home.dart';

void main() => runApp(TextToSpeechApp());

class TextToSpeechApp extends StatelessWidget {
  final FlutterTts flutterTts = FlutterTts();

  TextToSpeechApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Text_to_Speech',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: TextToSpeechScreen(flutterTts: flutterTts),
    );
  }
}

