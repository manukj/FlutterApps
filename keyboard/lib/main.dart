import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget build_key(int num, Color c) {
    return Expanded(
      child: FlatButton(
        onPressed: () {
          play_music(num);
        },
        color: c,
      ),
    );
  }

  void play_music(int song) {
    final player = AudioCache();
    player.play("note$song.wav");
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              build_key(1, Colors.red),
              build_key(2, Colors.orange),
              build_key(3, Colors.green),
              build_key(4, Colors.blue),
              build_key(5, Colors.black87),
              build_key(6, Colors.deepPurple),
              build_key(7, Colors.pink),
            ],
          ),
        ));
  }
}
