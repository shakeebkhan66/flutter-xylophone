import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final List sounds = [
    "c.wav",
    "d1.wav",
    "e1.wav",
    "f.wav",
    "g.wav",
    "a.wav",
    "b.wav",
    "c2.wav",
  ];

final AudioCache player = AudioCache();

class XylophonePlayer extends StatefulWidget {
  @override
  _XylophonePlayerState createState() => _XylophonePlayerState();
}

class _XylophonePlayerState extends State<XylophonePlayer> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xFF333333),
      body: Container(
        width: width,
        height: height,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[

            XylophoneBar(
              height: height * 0.9,
              text: "C",
              color: Colors.purple,
              note: 0,
            ),

            SizedBox(width: 10,),

            XylophoneBar(
              height: height * 0.85,
              text: "D",
              color: Colors.deepPurple,
              note: 1,
            ),

            SizedBox(width: 10,),

            XylophoneBar(
              height: height * 0.80,
              text: "E",
              color: Colors.blue,
              note: 2,
            ),

            SizedBox(width: 10,),

            XylophoneBar(
              height: height * 0.75,
              text: "F",
              color: Colors.green,
              note: 3,
            ),

            SizedBox(width: 10,),

            XylophoneBar(
              height: height * 0.70,
              text: "G",
              color: Colors.greenAccent,
              note: 4,
            ),

            SizedBox(width: 10,),

            XylophoneBar(
              height: height * 0.65,
              text: "A",
              color: Colors.yellow,
              note: 5,
            ),

            SizedBox(width: 10,),

            XylophoneBar(
              height: height * 0.60,
              text: "B",
              color: Colors.orange,
              note: 6,
            ),

            SizedBox(width: 10,),

            XylophoneBar(
              height: height * 0.55,
              text: "C",
              color: Colors.red,
              note: 7,
            ),

          ],
        ),
      ),
    );
  }
}

class XylophoneBar extends StatelessWidget {
  final height;
  final text;
  final Color color;
  final int note;

  XylophoneBar({this.height, this.text, this.color, this.note});

  play(note) async {
    player.play(sounds[note]);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        play(note);
      },
      child: Container(
        height: height,
        padding: EdgeInsets.all(30),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(text),
      ),
    );
  }
}
