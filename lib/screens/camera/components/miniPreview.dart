import 'package:flutter/material.dart';
import 'package:snokscok/themes/const.dart';

class MiniPreview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(40),
      decoration: BoxDecoration(
        border: Border.all(color: Pallet.silkDark, width: 1.0),
        borderRadius: BorderRadius.circular(10),
        color: Pallet.silkDark,
      ),
    );
  }
}
