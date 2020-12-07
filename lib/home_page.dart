import 'package:flutter/material.dart';
import 'package:furniture_app/components/my_nav_bar.dart';
import 'package:furniture_app/screens/dataScreen/data.dart';
import 'package:furniture_app/screens/dataScreen/info_screen.dart';
import 'package:furniture_app/screens/product/products_screen.dart';
import 'package:furniture_app/screens/profile/profile_screen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _pageController = PageController();
  List<Widget> _screens = [
    HomeScreen(),
    InfoScreen(),
    ProductsScreen(),
    ProfileScreen()
  ];

  int _selectedIndex = 0;
  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void onItemTapped(int selectedIndex) {
    _pageController.animateToPage(
      selectedIndex,
      curve: Curves.easeInOut,
      duration: Duration(milliseconds: 350),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: _screens,
        onPageChanged: _onPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: MyBottomNavBar(
        onTap: onItemTapped,
        index: _selectedIndex,
      ),
    );
  }
}
