import 'package:a_gooddayapp/artistdetail_potato.dart';
import 'package:a_gooddayapp/artistdetail_tangmo.dart';
import 'package:a_gooddayapp/artistdetail_tilly.dart';
import 'package:a_gooddayapp/player_luxtherpaitookwan.dart';
import 'package:a_gooddayapp/player_tangmo.dart';
import 'package:a_gooddayapp/player_taraojerkunaek.dart';
import 'package:a_gooddayapp/player_tatherluxchanjing.dart';
import 'package:flutter/material.dart';
import 'package:a_gooddayapp/SizeConfig.dart';
import 'package:a_gooddayapp/artistdetail_3md.dart';
import 'package:a_gooddayapp/albums.dart';

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
              home: Artists(),
            );
          },
        );
      },
    );
  }
}

class Artists extends StatefulWidget {
  Artists({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _ArtistsState createState() => _ArtistsState();
}

class _ArtistsState extends State<Artists> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
      child:
       Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 20.0),
            child: Container(
              height: 20 * SizeConfig.heightMultiplier,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  //1
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ArtistsDetail_3md()));
                    },
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: 24 * SizeConfig.widthMultiplier,
                          height: 12 * SizeConfig.heightMultiplier,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: new DecorationImage(
                                  fit: BoxFit.cover,
                                  image:
                                      AssetImage("assets/3mandowncover.jpg"))),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          "Three Man Down",
                          style: TextStyle(
                              fontFamily: 'Nunito',
                              fontSize: 2.3 * SizeConfig.textMultiplier,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  //1
                  SizedBox(
                    width: 20.0,
                  ),
                  //2
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ArtistsDetail_potato()));
                    },
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: 24 * SizeConfig.widthMultiplier,
                          height: 12 * SizeConfig.heightMultiplier,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: new DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage("assets/potatocover.jpg"))),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          "POTATO",
                          style: TextStyle(
                              fontFamily: 'Nunito',
                              fontSize: 2.3 * SizeConfig.textMultiplier,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  //2
                  SizedBox(
                    width: 20.0,
                  ),
                  //3
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ArtistsDetail_tilly()));
                    },
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: 24 * SizeConfig.widthMultiplier,
                          height: 12 * SizeConfig.heightMultiplier,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: new DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                      "assets/tillybirdscover.jpg"))),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          "Tilly Birds",
                          style: TextStyle(
                              fontFamily: 'Nunito',
                              fontSize: 2.3 * SizeConfig.textMultiplier,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  //3
                  SizedBox(
                    width: 20.0,
                  ),
                  //4
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ArtistsDetail_tangmo()));
                    },
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: 24 * SizeConfig.widthMultiplier,
                          height: 12 * SizeConfig.heightMultiplier,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: new DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage("assets/tangmo.jpg"))),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          "แตงโม นิดา",
                          style: TextStyle(
                              fontFamily: 'Nunito',
                              fontSize: 2.3 * SizeConfig.textMultiplier,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  //4
                  SizedBox(
                    width: 20.0,
                  ),
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
                    child: playListCard("assets/tillybirdscover.jpg",
                        "ถ้าเราเจอกันอีก (Until Then)", "Tilly Birds", "4:53"),
                  )
                ],
              ),
            ),
          )
        ],
      ),
      )
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
