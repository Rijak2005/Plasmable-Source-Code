import 'dart:async';

import 'package:flutter/material.dart';
import 'package:furniture_app/screens/dataScreen/data.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../sizeConfigSplash.dart';
import 'components/body.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    SizeConfig().init(context);
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Body(),
      ),
    );
  }
}
