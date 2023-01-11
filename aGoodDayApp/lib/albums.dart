import 'package:a_gooddayapp/albums_lovesongs.dart';
import 'package:a_gooddayapp/player_luxtherpaitookwan.dart';
import 'package:a_gooddayapp/player_taraojerkunaek.dart';
import 'package:a_gooddayapp/player_tatherluxchanjing.dart';
import 'package:flutter/material.dart';
import 'package:a_gooddayapp/SizeConfig.dart';
import 'package:a_gooddayapp/Player_tangmo.dart';

import 'albums_sadsongs.dart';

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
              home: Albums(),
            );
          },
        );
      },
    );
  }
}

class Albums extends StatefulWidget {
  Albums({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _AlbumsState createState() => _AlbumsState();
}

class _AlbumsState extends State<Albums> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 20.0),
              child: Container(
                height: 27 * SizeConfig.heightMultiplier,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Albums_lovesongs()));
                      },
                      child: _albumCard("assets/lovecover.jpg", "LOVE SONGS"),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                   Albums_sadsongs()));
                      },
                      child: _albumCard("assets/sadcover.jpg", "SAD SONGS"),
                    )
                    //  SizedBox(width: 10.0,),
                    // _albumCard("assets/notimetodiebe.jpg"),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 40.0),
              child: Text(
                "Playlists",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Nunito-Regular',
                    fontSize: 3.8 * SizeConfig.textMultiplier),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20.0, right: 20.0, top: 20.0, bottom: 20.0),
              child: Container(
                child: Column(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Player_tangmo()));
                      },
                      child: playListCard("assets/tangmo.jpg",
                          "จากนี้ไปจนนิรันด์", "แตงโม นิดา", "3:58"),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    Player_tatherluxchanjing()));
                      },
                      child: playListCard("assets/3mandowncover.jpg",
                          "ถ้าเธอรักฉันจริง", "Three Man Down", "3:48"),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    Player_luxtherpaitookwan()));
                      },
                      child: playListCard("assets/potatocover.jpg",
                          "รักเธอไปทุกวัน", "POTATO", "4:34"),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Player_taraojerkunaek()));
                      },
                      child: playListCard(
                          "assets/tillybirdscover.jpg",
                          "ถ้าเราเจอกันอีก (Until Then)",
                          "Tilly Birds",
                          "4:53"),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _albumCard(String assetImg, String typesongs) {
    return Container(
      height: 27 * SizeConfig.heightMultiplier,
      width: 40 * SizeConfig.widthMultiplier,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.0)),
      child: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Image.asset(
              assetImg,
              fit: BoxFit.cover,
              height: 27 * SizeConfig.heightMultiplier,
              width: 40 * SizeConfig.widthMultiplier,
            ),
          ),
          Positioned(
            bottom: 10.0,
            right: 10.0,
            child: Text(
              typesongs,
              style: TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 2 * SizeConfig.textMultiplier,
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            bottom: 10.0,
            left: 10.0,
            child: CircleAvatar(
              backgroundColor: Colors.white70,
              child: Icon(
                Icons.play_arrow,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }

  playListCard(String asset, String albumName, String artist, String duration) {
    return Container(
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.asset(
              asset,
              fit: BoxFit.cover,
              height: 12 * SizeConfig.imageSizeMultiplier,
              width: 12 * SizeConfig.imageSizeMultiplier,
            ),
          ),
          SizedBox(
            width: 20.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                albumName,
                style: TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: 2 * SizeConfig.textMultiplier,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                artist,
                style: TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 1.7 * SizeConfig.textMultiplier,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          Spacer(),
          Text(
            duration,
            style: TextStyle(
                fontFamily: 'Nunito',
                fontSize: 2.3 * SizeConfig.textMultiplier,
                color: Colors.black),
          ),
          SizedBox(
            width: 20.0,
          ),
          FavoritWidget(),
          // Icon(Icons.favorite_border, color: Colors.black,)
        ],
      ),
    );
  }
}

class FavoritWidget extends StatefulWidget {
  const FavoritWidget({Key? key}) : super(key: key);

  @override
  _FavoritWidgetState createState() => _FavoritWidgetState();
}

class _FavoritWidgetState extends State<FavoritWidget> {
  bool _isFavorited = true;
  //int _favoriteCount = 0;

  void _togleFavorite() {
    setState(() {
      if (_isFavorited) {
        _isFavorited = false;
      } else {
        _isFavorited = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(0),
          child: IconButton(
            padding: const EdgeInsets.all(0),
            alignment: Alignment.centerRight,
            icon: _isFavorited
                ? const Icon(Icons.favorite_border, color: Colors.black)
                : const Icon(Icons.favorite, color: Colors.black),
            onPressed: _togleFavorite,
          ),
        ),
      ],
    );
  }
}
