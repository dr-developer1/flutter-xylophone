import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const XylophoneApp());
}

class XylophoneApp extends StatelessWidget {
  const XylophoneApp({Key? key}) : super(key: key);

  void playNote(int noteNumber) {
    final player = AudioPlayer();
    player.play(AssetSource('sounds/note$noteNumber.wav'));
  }

  TextButton buildKey(
      {required Color color,
      required int soundNumber,
      required double height,
      required String noteName}) {
    return TextButton(
      style: TextButton.styleFrom(
        fixedSize: Size(100, height),
        foregroundColor: Colors.white,
        backgroundColor: color,
        textStyle: const TextStyle(fontSize: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 10,
      ),
      onPressed: () {
        playNote(soundNumber);
      },
      child: Stack(
        children: [
          Positioned(
            left: 30.0,
            right: 30.0,
            top: 10,
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 30.0,
            right: 30.0,
            bottom: 10,
            child: Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
            ),
          ),
          Center(child: Text(noteName)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    // Set landscape orientation
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    // Hide the status bar
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

    return MaterialApp(
      home: Scaffold(
        body: Stack(children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/wallpaper.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  buildKey(
                      color: Colors.red,
                      soundNumber: 1,
                      height: 350,
                      noteName: 'C'),
                  const SizedBox(width: 10),
                  buildKey(
                      color: Colors.orange,
                      soundNumber: 2,
                      height: 330,
                      noteName: 'D'),
                  const SizedBox(width: 10),
                  buildKey(
                      color: Colors.yellow,
                      soundNumber: 3,
                      height: 310,
                      noteName: 'E'),
                  const SizedBox(width: 10),
                  buildKey(
                      color: Colors.green,
                      soundNumber: 4,
                      height: 290,
                      noteName: 'F'),
                  const SizedBox(width: 10),
                  buildKey(
                      color: Colors.blue,
                      soundNumber: 5,
                      height: 270,
                      noteName: 'G'),
                  const SizedBox(width: 10),
                  buildKey(
                      color: Colors.indigo,
                      soundNumber: 6,
                      height: 250,
                      noteName: 'A'),
                  const SizedBox(width: 10),
                  buildKey(
                      color: Colors.purple,
                      soundNumber: 7,
                      height: 230,
                      noteName: 'B'),
                ],
              ),
            ),
          ),
          const Positioned(
            bottom: 10,
            right: 10,
            child: Text(
              '© Ahmad IBRAHIM - 2023',
              style: TextStyle(
                fontSize: 23,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
