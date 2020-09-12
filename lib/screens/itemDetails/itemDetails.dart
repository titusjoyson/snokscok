import 'package:flutter/material.dart';
import 'package:snokscok/components/layout/appBar.dart';
import 'package:snokscok/components/background/lightBackground.dart';

class ItemDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LightBackground(
      appBar: TransparentAppBar(
        title: "Book Details",
      ),
      // The image is stored as a file on the device. Use the `Image.file`
      // constructor with the given path to display the image.
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[],
        ),
      ),
    );
  }
}
