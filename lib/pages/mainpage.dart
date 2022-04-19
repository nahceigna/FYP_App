/// import libraries
import 'package:flutter/material.dart';
import 'package:fyp_app/pages/homepage.dart';
import 'package:fyp_app/pages/map.dart';
import 'package:fyp_app/pages/settings.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  /// pages
  final List<Widget> screens = [
    const Homepage(),
    const Mappage(),
    const Settings(),
  ];

  /// default selected page
  int selectedIndex = 0;

  /// pagecontroller function
  PageController pageController = PageController();

  /// function for onPageChanged in PageView
  void onPageChanged(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  /// function for onTap in bottom Navigation bar
  void onItemTapped(int selectedPageIndex) {
    pageController.jumpToPage(selectedPageIndex);
    setState(() {
      selectedIndex = selectedPageIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: screens,
        onPageChanged: onPageChanged, // change the selected index
        physics:
            const NeverScrollableScrollPhysics(), // disable scrolling between pages
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onItemTapped,
        type: BottomNavigationBarType.fixed,
        currentIndex:
            selectedIndex, // hold the value of the current selected item
        selectedFontSize: 15.0,
        unselectedFontSize: 14.0,
        selectedItemColor: const Color(0xFF1565C0),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.map_rounded), label: 'Map'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}
