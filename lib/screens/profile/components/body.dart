import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:furniture_app/screens/profile/components/profile_menu_item.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../size_config_profile.dart';
import 'info.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String nameState;
  String emailState;
  @override
  void initState() {
    super.initState();
    getName();
    getEmail();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Info(
            image: "assets/images/Item_1.png",
            name: nameState ?? "John Doe",
            email: emailState ?? "johndoe@gmail.com",
          ),
          SizedBox(height: SizeConfig.defaultSize * 2), //20
          ProfileMenuItem(
            iconSrc: "assets/icons/language.svg",
            title: "Change Language",
            press: () {
              Fluttertoast.showToast(
                msg: "Feature Coming Soon!",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
              );
            },
          ),
          ProfileMenuItem(
            iconSrc: "assets/icons/info.svg",
            title: "Help",
            press: () {
              Fluttertoast.showToast(
                msg: "Feature Coming Soon!",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
              );
            },
          ),
        ],
      ),
    );
  }

  getName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var name = prefs.getString("name");
    setState(() {
      nameState = name;
    });
  }

  getEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var email = prefs.getString("email");
    setState(() {
      emailState = email;
    });
  }
}
