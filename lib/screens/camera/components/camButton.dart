import 'package:flutter/material.dart';
import 'package:snokscok/themes/const.dart';

class CameraButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 60.0,
      // width: 60.0,
      margin: EdgeInsets.all(30),
      decoration: BoxDecoration(
        border: Border.all(color: Pallet.silkDark, width: 1.0),
        borderRadius: BorderRadius.circular(50.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Pallet.silkDark, blurRadius: 8.0),
        ],
      ),
    );
  }
}
