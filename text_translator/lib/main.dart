import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

void main() => runApp(TextToSpeechApp());

class TextToSpeechApp extends StatelessWidget {
  final FlutterTts flutterTts = FlutterTts();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Text to Speech',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TextToSpeechScreen(flutterTts: flutterTts),
    );
  }
}

class TextToSpeechScreen extends StatefulWidget {
  final FlutterTts flutterTts;

  const TextToSpeechScreen({Key? key, required this.flutterTts})
      : super(key: key);

  @override
  _TextToSpeechScreenState createState() => _TextToSpeechScreenState();
}

class _TextToSpeechScreenState extends State<TextToSpeechScreen> {
  String _text = '';

  Future<void> _speak() async {
    await widget.flutterTts.setLanguage('en-US');
    await widget.flutterTts.setPitch(1.0);
    await widget.flutterTts.setSpeechRate(0.8);
    await widget.flutterTts.speak(_text);
  }

  Future<void> _stop() async {
    await widget.flutterTts.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text to Speech'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              onChanged: (value) {
                setState(() {
                  _text = value;
                });
              },
              decoration: const InputDecoration(
                labelText: 'Enter text',
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _speak,
              child: const Text('Speak'),
            ),
            const SizedBox(height: 8.0),
            ElevatedButton(
              onPressed: _stop,
              child: const Text('Stop'),
            ),
          ],
        ),
      ),
    );
  }
}
