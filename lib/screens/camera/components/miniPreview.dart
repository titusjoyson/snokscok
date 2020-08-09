import 'package:flutter/material.dart';
import 'package:snokscok/themes/const.dart';

class MiniPreview extends StatelessWidget {
  MiniPreview({this.onTap});
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(40),
      child: Material(
        borderRadius: BorderRadius.circular(10),
        child: Ink(
          decoration: BoxDecoration(
            border: Border.all(color: Pallet.silkDark, width: 1.0),
            borderRadius: BorderRadius.circular(10),
            //color: Pallet.silkDark,
            image: DecorationImage(
              image: NetworkImage('https://picsum.photos/140/200/'),
              fit: BoxFit.fill,
            ),
          ),
          child: InkWell(
            onTap: () {
              this.onTap();
            },
          ),
        ),
      ),
    );
  }
}
