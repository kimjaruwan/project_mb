import 'package:flutter/material.dart';

import 'SizeConfig.dart';

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
              home: Developer(),
            );
          },
        );
      },
    );
  }
}

class Developer extends StatefulWidget {
  Developer({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _DeveloperState createState() => _DeveloperState();
}

class _DeveloperState extends State<Developer> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 50.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(
                  height: 50.0,
                ),
              ],
            ),
          ),

//bottomHome

          ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Image.asset(
              "assets/developer.jpg",
              fit: BoxFit.cover,
              height: 40 * SizeConfig.heightMultiplier,
              width: 60 * SizeConfig.widthMultiplier,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            "63130700346 - Jaruwan Soiyam",
            style: TextStyle(
                fontFamily: 'Nunito-Bold',
                letterSpacing: 1.0,
                fontSize: 2 * SizeConfig.textMultiplier,
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 15.0,
          ),

          Text(
            "Information Technology",
            style: TextStyle(
              fontFamily: 'Nunito-Bold',
              letterSpacing: 1.0,
              fontSize: 2 * SizeConfig.textMultiplier,
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          Text(
            "King Mongkut's University of Technology Thonburi",
            style: TextStyle(
              fontFamily: 'Nunito-Bold',
              letterSpacing: 1.0,
              fontSize: 2 * SizeConfig.textMultiplier,
              color: Colors.black,
            ),
          ),
        ],
      ),
    ));
  }
}
