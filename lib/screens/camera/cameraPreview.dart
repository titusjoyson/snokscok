import 'dart:io';

import 'package:flutter/material.dart';
import 'package:snokscok/components/layout/appBar.dart';
import 'package:snokscok/components/background/lightBackground.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:snokscok/themes/const.dart';
import 'package:snokscok/components/carousel/fullCarousel.dart';
import 'package:snokscok/components/text.dart';

class CarouselComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
      child: Column(
        children: <Widget>[
          CarouselLarge(),
          Container(
            width: MediaQuery.of(context).size.width * 0.65,
            margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Header("Red Rose"),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                  child: BodyLite("Drama | 2h 20m"),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                  child: SubHeader("IMDB 6.6/10"),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  const DisplayPictureScreen({Key key, this.imagePath}) : super(key: key);

  getImage() {
    if (this.imagePath != null) {
      return Image.file(File(imagePath));
    } else {
      return;
    }
  }

  getLoader() {
    return SpinKitCubeGrid(
      color: Pallet.shabbyRed,
      size: 40.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return LightBackground(
      appBar: TransparentAppBar(
        title: "Matching Results",
      ),
      // The image is stored as a file on the device. Use the `Image.file`
      // constructor with the given path to display the image.
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            CarouselComponent(),
            Container(
              height: 80,
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: Pallet.brownDark,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
