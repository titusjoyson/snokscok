import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:snokscok/components/background/lightBackground.dart';
import 'package:snokscok/themes/const.dart';
import 'package:snokscok/screens/camera/camera.dart';
import 'package:snokscok/screens/recentClicks/recent.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return LightBackground(
      child: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() => _currentIndex = index);
        },
        children: <Widget>[
          Container(
            color: Pallet.silk,
            child: RecentPage(),
          ),
          Container(
            color: Pallet.silk,
          ),
          Container(
            color: Pallet.silk,
          ),
          Container(
            color: Pallet.silk,
          ),
          Container(
            color: Pallet.silk,
          ),
        ],
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController.jumpToPage(index);
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
              title: Text('Snap'),
              icon: Icon(Icons.camera),
              activeColor: Pallet.shabbyRed,
              inactiveColor: Pallet.brownDark),
          BottomNavyBarItem(
              title: Text('Books'),
              icon: Icon(Icons.book),
              activeColor: Pallet.shabbyRed,
              inactiveColor: Pallet.brownDark),
          // BottomNavyBarItem(
          //   title: Text('Exchange'),
          //   icon: Icon(Icons.apps),
          //   activeColor: Pallet.shabbyRed,
          //   inactiveColor: Pallet.brownDark
          // ),
          BottomNavyBarItem(
              title: Text('Feeds'),
              icon: Icon(Icons.rss_feed),
              activeColor: Pallet.shabbyRed,
              inactiveColor: Pallet.brownDark),
          BottomNavyBarItem(
              title: Text('Settings'),
              icon: Icon(Icons.settings),
              activeColor: Pallet.shabbyRed,
              inactiveColor: Pallet.brownDark),
        ],
      ),
    );
  }
}
