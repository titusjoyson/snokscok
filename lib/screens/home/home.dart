import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:snokscok/components/background/lightBackground.dart';
import 'package:snokscok/themes/const.dart';
import 'package:snokscok/screens/recentClicks/recent.dart';
import 'package:snokscok/screens/commingSoon/soon.dart';

class PageContainer extends StatelessWidget {
  PageContainer({this.child});
  Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
      color: Pallet.silk,
      child: this.child,
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 1;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
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
          PageContainer(
            child: RecentPage(),
          ),
          Container(
            child: CommingSoon(),
            color: Pallet.silk,
          ),
          Container(
            child: CommingSoon(),
            color: Pallet.silk,
          ),
          Container(
            child: CommingSoon(),
            color: Pallet.silk,
          ),
          Container(
            child: CommingSoon(),
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
          BottomNavyBarItem(
              title: Text('Store'),
              icon: Icon(Icons.store),
              activeColor: Pallet.shabbyRed,
              inactiveColor: Pallet.brownDark),
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
