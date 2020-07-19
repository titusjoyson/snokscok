import 'dart:math';
import 'package:flutter/material.dart';
import 'package:snokscok/themes/const.dart';

class CardWidget extends StatelessWidget {
  CardWidget({this.onTap});
  static var rng = new Random();
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    var rngCount = rng.nextInt(10).toString();
    var imageUrl = 'https://picsum.photos/140/200/?rand=$rngCount';

    return Container(
      width: 160.0,
      padding: EdgeInsets.all(10),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            print("Container clicked");
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              //color: Colors.white,
              image: DecorationImage(
                //alignment: Alignment(-.2, 0),
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
