import 'dart:async';

import 'package:flutter/material.dart';
import 'package:furniture_app/constants.dart' as col;
import 'package:furniture_app/home_page.dart';
import 'package:furniture_app/screens/dataScreen/data.dart';
import 'package:furniture_app/screens/splash_screen/splash_screen.dart'
    as realSc;
import 'package:furniture_app/screens/splash_screen/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../sizeConfigSplash.dart';
// import 'package:splashscreen/splashscreen.dart';

class LogoScreen extends StatefulWidget {
  @override
  _LogoScreenState createState() => _LogoScreenState();
}

class _LogoScreenState extends State<LogoScreen> {
  var preferences;
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/g1177.png",
                scale: getProportionateScreenWidth(11.0),
              ),
            ],
          ),
        ),
      ),
    );
  }

  startTimer() {
    var _duration = Duration(milliseconds: 2000);
    return Timer(_duration, navigate);
  }

  navigate() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (preferences.getBool("is_logged_in") == true) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return HomePage();
      }));
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return SplashScreen();
      }));
    }
  }
}
