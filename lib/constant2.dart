import 'package:flutter/material.dart';
import 'package:furniture_app/sizeConfigSplash.dart';

// Colors
const kBackgroundColor = Color(0xFFFEFEFE);
const kTitleTextColor = Color(0xFF303030);
const kBodyTextColor = Color(0xFF4B4B4B);
const kTextLightColor = Color(0xFF959595);
const kInfectedColor = Color(0xFFFF8748);
const kDeathColor = Color(0xFFFF4848);
const kRecovercolor = Color(0xFF36C12C);
const kPrimaryColor = Color(0xFF3382CC);
final kShadowColor = Color(0xFFB7B7B7).withOpacity(.16);
final kActiveShadowColor = Color(0xFFE11215).withOpacity(.15);

// Text Style
var kHeadingTextStyle = TextStyle(
  fontSize: getProportionateScreenWidth(16.0),
  fontWeight: FontWeight.w600,
);

var kSubTextStyle = TextStyle(
    fontSize: getProportionateScreenWidth(16.0), color: kTextLightColor);

var kTitleTextstyle = TextStyle(
  fontSize: getProportionateScreenWidth(18.0),
  color: kTitleTextColor,
  fontWeight: FontWeight.bold,
);
