import 'package:flutter/material.dart';


class PngImage extends StatelessWidget {
  PngImage(this.image);
  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(25, 25, 25, 0),
        child: Image.asset(this.image)
    );
  }
}