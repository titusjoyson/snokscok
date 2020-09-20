import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:snokscok/themes/const.dart';

class BarcodeNavButton extends StatelessWidget {
  BarcodeNavButton({this.onClick});

  Function onClick;

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
            this.onClick();
          },
          child: Container(
            width: 165,
            height: 60,
            padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
            child: Row(
              children: [
                Icon(
                  FontAwesome.barcode,
                  color: Colors.white,
                  size: 30.0,
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Text(
                    "Scan Barcode",
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
