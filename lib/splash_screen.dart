import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rama_puzle/quiz.dart';

import 'CustomColor.dart';
import 'VideoDisplay.dart';
import 'addPost.dart';
import 'body1.dart';
import 'comment.dart';
import 'contactUs.dart';
import 'demo.dart';
import 'CommunitySection.dart';

import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp2());
}

class MyApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
      routes: {
        '/home': (context) => HomeScreen(), // Replace HomeScreen with your main screen
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.of(context).pushReplacementNamed('/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          // You can customize the splash screen background here
        ),
        child: Center(
          child: FlutterLogo(
            size: 150,
            // You can use your own logo/image here
          ),
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Text('Welcome to the Home Screen!'),
      ),
    );
  }
}


/*class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) =>
        //Comment1()
        Body2(isLogin: false,)
          *//*AddPost()*//*
          *//*VideoDisplay(category_id: 0,
          sub_category_id: "",sub_name: "", )*//* *//* CommunitySection()*//* *//*Body4(isLogin: false,)*//* *//*Body2(isLogin: false)*//*),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        width: 500,
        height: 800,
        decoration: BoxDecoration(
            color: Colors.amber
        ),
      ),);
  }
}*/
/*body: Container(

        decoration: BoxDecoration(
            color: ColorConstants.backgroundColor,
          image: DecorationImage(
            image: new AssetImage("assets/images/splash_screen.png"),

          ),
        ),
      ),
    );*/
