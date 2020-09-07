import 'package:flutter/material.dart';

class CameraButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Material(
        borderRadius: BorderRadius.circular(100),
        child: InkWell(
          onTap: () {},
          child: Container(
            height: 70,
            width: 70,
          ),
        ),
      ),
    );
  }
}
