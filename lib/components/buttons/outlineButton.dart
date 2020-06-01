import 'package:flutter/material.dart';
import 'package:snokscok/themes/const.dart';


class ImageIconButton extends StatelessWidget {
  ImageIconButton(this.onPressed, this.text);
  final GestureTapCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return FlatButton.icon(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
      ),
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 12.0),
      onPressed: onPressed,
      label: Text(this.text, style: TextStyles.button,),
      icon: Container(
        child: Image(
          image: AssetImage(
            "assets/images/icons/goodreads-square-light.png",
          ),
          fit: BoxFit.fitHeight,
        ),
        height: 30,
        width: 30,
        padding: EdgeInsets.fromLTRB(0, 2, 0, 2),
      ),
    );
  }
}

