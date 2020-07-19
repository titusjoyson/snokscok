import 'package:flutter/material.dart';
import 'package:snokscok/themes/const.dart';

class CameraNavButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Pallet.shabbyRed,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            print("Container clicked");
          },
          child: new Container(
            width: 165,
            padding: new EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
            child: new Row(
              children: [
                Icon(
                  Icons.filter_center_focus,
                  color: Colors.white,
                  size: 50.0,
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Text(
                    "Tap To Scan",
                    style: TextStyles.camButton,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
