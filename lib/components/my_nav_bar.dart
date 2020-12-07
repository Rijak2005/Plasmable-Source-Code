import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furniture_app/screens/dataScreen/data.dart';
import 'package:furniture_app/screens/dataScreen/info_screen.dart';
import 'package:furniture_app/screens/product/products_screen.dart';
import 'package:furniture_app/screens/profile/profile_screen.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

import '../constants.dart';
import '../constants.dart';
import '../screens/details/details_screen.dart';

class MyBottomNavBar extends StatefulWidget {
  final index;
  final onTap;
  const MyBottomNavBar({
    Key key,
    this.index,
    this.onTap,
  }) : super(key: key);

  @override
  _MyBottomNavBarState createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(blurRadius: 10, color: kPrimaryColor.withOpacity(.1))
      ]),
      child: SafeArea(
        child: Container(
          color: kSecondaryColor,
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
          child: GNav(
              gap: 0,
              color: Colors.white,
              activeColor: kPrimaryColor,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              duration: Duration(milliseconds: 310),
              tabBackgroundColor: Colors.white,
              tabs: [
                GButton(
                  icon: LineIcons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: LineIcons.info,
                  text: "Info",
                ),
                GButton(
                  icon: Icons.opacity,
                  text: 'Donors',
                ),
                GButton(
                  icon: LineIcons.user,
                  text: 'Profile',
                ),
              ],
              selectedIndex: widget.index ?? 0,
              onTabChange: widget.onTap),
        ),
      ),
    );
  }
}
