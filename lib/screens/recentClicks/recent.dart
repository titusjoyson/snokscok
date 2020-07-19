import 'package:flutter/material.dart';
import 'package:snokscok/components/buttons/cameraNavButton.dart';
import 'package:snokscok/components/sliders.dart';
import 'package:snokscok/components/card.dart';

class RecentPage extends StatelessWidget {
  final recentSugData = [{}, {}, {}, {}, {}];
  final recentSnapData = [{}, {}, {}, {}, {}];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(height: 20),
          HorizontalList(
            title: "Recent Snaps",
            showMore: true,
            onViewMorePress: () {},
            cards: recentSugData.map((d) => CardWidget()).toList(),
          ),
          HorizontalList(
            title: "Recent suggections",
            showMore: true,
            onViewMorePress: () {},
            cards: recentSugData.map((d) => CardWidget()).toList(),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CameraNavButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
