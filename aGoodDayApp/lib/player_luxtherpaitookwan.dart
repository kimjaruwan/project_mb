//import 'dart:html';

// ignore_for_file: camel_case_types

//import 'package:audioplayers/audioplayers.dart';
import 'package:a_gooddayapp/player_kangkun.dart';
import 'package:a_gooddayapp/player_pakdee.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:a_gooddayapp/SizeConfig.dart';

import 'main.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig().init(constraints, orientation);
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'HomeScreen App',
              home: Player_luxtherpaitookwan(),
            );
          },
        );
      },
    );
  }
}

class Player_luxtherpaitookwan extends StatefulWidget {
  Player_luxtherpaitookwan({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _PlayerState createState() => _PlayerState();
}

class _PlayerState extends State<Player_luxtherpaitookwan>
    with SingleTickerProviderStateMixin {
  //audio

  bool _isPlay = false;
  late AnimationController _controller;
  AssetsAudioPlayer player = AssetsAudioPlayer();

  //audio

  double _value = 0.0;
  void _setValue(double value) {
    setState(() {
      _value = value;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    _controller =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
    super.initState();
    player.open(Audio('assets/luxtherpaitookwan-potato.mp3'),
        autoStart: true, showNotification: true);
    //add 2 audio
  }

  // Dispose the controller
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
    player.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 50.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      player.stop();
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                    )),
                Text(
                  "NOW PLAYING",
                  style: TextStyle(
                      fontFamily: 'Nunito-Bold',
                      letterSpacing: 1.0,
                      fontSize: 2 * SizeConfig.textMultiplier,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 80.0,
                ),
              ],
            ),
          ),
//bottomHome
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MusicHome()));
                      player.stop();
                    },
                    child: Container(
                      width: 150,
                      height: 45,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Text(
                          "Home",
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'Nunito-Bold',
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                      ),
                    ),
                  ),
                ]),
          ),
//bottomHome





          SizedBox(
            height: 45.0,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Image.asset(
              "assets/potatocover.jpg",
              fit: BoxFit.cover,
              height: 40 * SizeConfig.heightMultiplier,
              width: 60 * SizeConfig.widthMultiplier,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            "รักเธอไปทุกวัน",
            style: TextStyle(
                fontFamily: 'Nunito-Bold',
                letterSpacing: 1.0,
                fontSize: 3 * SizeConfig.textMultiplier,
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 15.0,
          ),
          Text(
            "POTATO",
            style: TextStyle(
              fontFamily: 'Nunito-Bold',
              letterSpacing: 1.0,
              fontSize: 2 * SizeConfig.textMultiplier,
              color: Colors.black,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 20.0),
            child: Slider(
              activeColor: Colors.orangeAccent,
              value: _value,
              inactiveColor: Colors.grey,
              onChanged: _setValue,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                      GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Player_kangkun()));
                      player.stop();
                    },
                    child: Icon(
                      Icons.arrow_left,
                      color: Colors.black,
                      size: 60,
                    )),
                CircleAvatar(
                  backgroundColor: Colors.black87,
                  radius: 40.0,
                  child: IconButton(
                    iconSize: 50,
                    color: Colors.white,
                    icon: AnimatedIcon(
                        icon: AnimatedIcons.pause_play, progress: _controller),
                    onPressed: () {
                      if (_isPlay == false) {
                        _controller.forward();
                        _isPlay = true;
                        player.pause();
                      } else {
                        _controller.reverse();
                        _isPlay = false;

                        player.play();
                      }
                    },
                  ),
                ),
                    GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Player_pakdee()));
                      player.stop();
                    },
                    child: Icon(
                      Icons.arrow_right,
                      color: Colors.black,
                      size: 60,
                    )),

              ],
            ),
          )
        ],
      ),
    );
  }

//ref 1 https://www.youtube.com/watch?v=NKVnntgjCnw
//ref 2 https://www.kindacode.com/article/using-animatedicon-in-flutter/

}
