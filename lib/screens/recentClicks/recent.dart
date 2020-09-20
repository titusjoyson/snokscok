import 'package:flutter/material.dart';
import 'package:snokscok/components/buttons/cameraNavButton.dart';
import 'package:snokscok/components/buttons/barcodeNavButton.dart';
import 'package:snokscok/components/sliders.dart';
import 'package:snokscok/components/card.dart';

class RecentPage extends StatefulWidget {
  @override
  _RecentPageState createState() => new _RecentPageState();
}

class _RecentPageState extends State<RecentPage> {
  String _imagePath = 'Unknown';
  final recentSugData = [];
  final recentSnapData = [];

  @override
  void initState() {
    super.initState();
  }

  Future startScan(module) async {
    if (module == "ocr") {
    } else {}
  }

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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                CameraNavButton(onClick: () {
                  Navigator.pushNamed(context, 'camera');
                  // startScan("ocr");
                }),
                BarcodeNavButton(onClick: () {
                  Navigator.pushNamed(context, 'camera');
                  // startScan("barcode");
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
