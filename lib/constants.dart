import 'package:flutter/material.dart';
import 'package:furniture_app/sizeConfigSplash.dart';

// list of colors that we use in our app
const kBackgroundColor = Color(0xFFF8F8F8);
const kPrimaryColor = Color(0xFFE11215);
const kSecondaryColor = Color(0xFFF10205);
const kTextColor = Color(0xFF000839);
const kAnimationDuration = Duration(milliseconds: 200);
const kTextLightColor = Color(0xFF747474);
const kBlueColor = Color(0xFF3382CC);

final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kNameNullError = "Please Enter your name";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNamelNullError = "Please Enter your name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kAddressNullError = "Please Enter your address";

final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

const kDefaultPadding = 20.0;

// our default Shadow
const kDefaultShadow = BoxShadow(
  offset: Offset(0, 15),
  blurRadius: 27,
  color: Colors.black12, // Black color with 12% opacity
);
