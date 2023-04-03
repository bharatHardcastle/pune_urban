import 'dart:async';
import 'package:flutter/material.dart';

import 'ChangeLanguagePage.dart';


class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  bool _isLoggedIn = false;
   Animation<double> animation;
   AnimationController animationController;

  var _color = Colors.blue;
  bool _resized = false;

   Animation sizeAnimation;

  @override
  void initState() {
    super.initState();
    animationController =
    AnimationController(vsync: this, duration: Duration(seconds: 5))
      ..addListener(() {});
    animationController.forward();

    animation =
        CurvedAnimation(parent: animationController, curve: Curves.easeIn);
    sizeAnimation = Tween(begin: 0.5, end: 1.0).animate(animation);
    loadData();
    setState(() {});
  }

  Future<Timer> loadData() async {
    return new Timer(Duration(seconds: 10), onDoneLoading);
  }

  onDoneLoading() async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // _isLoggedIn = prefs.getBool('_isLoggedIn');
    // String type = prefs.getString('type');

    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => ChangeLanguagePage()));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //color: Color(0xfffffab9),
        child: Center(
          child: Container(
            height: MediaQuery.of(context).size.height*0.30,
            width: MediaQuery.of(context).size.width*0.50,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/Images/punepmc_logo.png"),
                   fit: BoxFit.fill,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}

