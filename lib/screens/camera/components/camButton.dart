import 'package:flutter/material.dart';
import 'package:snokscok/themes/const.dart';

class CameraButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(30),
      child: Material(
        borderRadius: BorderRadius.circular(50),
        child: InkWell(
          onTap: () {},
          child: Container(
            child: Container(
              margin: EdgeInsets.all(28),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                color: Pallet.sasBlack,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(4, 4), // changes position of shadow
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
