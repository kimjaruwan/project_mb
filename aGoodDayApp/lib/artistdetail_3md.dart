// ignore_for_file: camel_case_types

import 'package:a_gooddayapp/player_kangkun.dart';
import 'package:a_gooddayapp/player_paitorther.dart';
import 'package:a_gooddayapp/player_tatherluxchanjing.dart';
import 'package:flutter/material.dart';
import 'package:a_gooddayapp/SizeConfig.dart';
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
              home: ArtistsDetail_3md(),
            );
          },
        );
      },
    );
  }
}

class ArtistsDetail_3md extends StatefulWidget {
  ArtistsDetail_3md({Key? key, this.title}) : super(key: key);


  final String? title;

  @override
  _ArtistsDetailState createState() => _ArtistsDetailState();
}

class _ArtistsDetailState extends State<ArtistsDetail_3md> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 50.0),
                  child: Icon(Icons.arrow_back_ios, color: Colors.black,),
                )
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 40.0, left: 20.0, right: 20.0),
                child: Container(
                  height: 25 * SizeConfig.heightMultiplier,
                  child: Stack(
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image.asset("assets/3mandowncover.jpg", fit: BoxFit.cover,),
                      ),
                   
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 30.0),
              child: Text("Three Man Down", style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Nunito-Bold',
                  fontSize: 3.8 * SizeConfig.textMultiplier
              ),),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 5.0),
              child: Text("2M Listeners", style: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'Nunito-Regular',
                  fontSize: 2.5 * SizeConfig.textMultiplier
              ),),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 40.0),
              child: Text("Playlists", style: TextStyle(
                color: Colors.black,
                fontFamily: 'Nunito-Regular',
                fontSize: 3.8 * SizeConfig.textMultiplier
              ),),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 30.0, bottom: 20.0),
              child: Container(
                child: Column(
                  children: <Widget>[
                    //1
                    GestureDetector(
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Player_tatherluxchanjing()));
                      },child:
                    artistSongs("assets/3mandowncover.jpg", "ถ้าเธอรักฉันจริง", "Three Man Down", "3:48"),
                      ),
                    SizedBox(height: 20.0,),
                    //2
                    GestureDetector(
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Player_paitorther()));
                      },
                      child: artistSongs("assets/3mandowncover.jpg", "ไปเถอะเธอ", "Three Man Down", "3:44"),
                    ),

                    SizedBox(height: 20.0,),
                    //3
                    GestureDetector(
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Player_kangkun()));
                      },child:
                    artistSongs("assets/3mandowncover.jpg", "ข้างกัน", "Three Man Down", "4:56"),
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

  artistSongs(String asset, String albumName, String artist, String duration) {
    return Container(
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.asset(asset, fit: BoxFit.cover, height: 12 * SizeConfig.imageSizeMultiplier, width: 12 * SizeConfig.imageSizeMultiplier,),
          ),
          SizedBox(width: 20.0,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(albumName, style: TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 2 * SizeConfig.textMultiplier,
                  color: Colors.black,
                  fontWeight: FontWeight.bold
              ),),
              Text(artist, style: TextStyle(
                fontFamily: 'Nunito',
                fontSize: 1.7 * SizeConfig.textMultiplier,
                color: Colors.black,
              ),),
            ],
          ),
          Spacer(),
          Text(duration, style: TextStyle(
              fontFamily: 'Nunito',
              fontSize: 2.3 * SizeConfig.textMultiplier,
              color: Colors.black
          ),),
          SizedBox(width: 20.0,),
          FavoritWidget(),
        ],
      ),
    );
  }


}