import 'dart:io';

import 'package:flutter/material.dart';
import 'package:snokscok/components/layout/appBar.dart';
import 'package:snokscok/components/background/lightBackground.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:snokscok/themes/const.dart';
import 'package:snokscok/components/carousel/fullCarousel.dart';

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
    return Center(
      child: Container(
        //margin: EdgeInsets.fromLTRB(0, 120, 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SpinKitCubeGrid(
              color: Pallet.shabbyRed,
              size: 40.0,
            ),
          ],
        ),
      ),
    );
  }

  getChildComponents() {
    return CarouselLarge();
  }

  @override
  Widget build(BuildContext context) {
    return LightBackground(
      appBar: TransparentAppBar(
        title: "Matching Results",
      ),
      // The image is stored as a file on the device. Use the `Image.file`
      // constructor with the given path to display the image.
      child: getChildComponents(),
    );
  }
}
