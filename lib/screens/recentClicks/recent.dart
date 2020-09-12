import 'package:flutter/material.dart';
import 'package:snokscok/components/buttons/cameraNavButton.dart';
import 'package:snokscok/components/sliders.dart';
import 'package:snokscok/components/card.dart';

class RecentPage extends StatelessWidget {
  final recentSugData = [];
  final recentSnapData = [];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          HorizontalList(
            title: "Recent Snaps",
            showMore: true,
            containerHeight: 160.0,
            onViewMorePress: () {
              Navigator.pushNamed(context, 'listScreen');
            },
            cards: recentSugData
                .map((d) => CardWidget(
                      conteinarHeight: 140,
                    ))
                .toList(),
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
                CameraNavButton(onClick: () {
                  Navigator.pushNamed(context, 'camera');
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
