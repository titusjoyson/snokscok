import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final double conteinarHeight;
  final double conteinarWidth;
  CardWidget({
    this.onTap,
    this.conteinarHeight: 200.0,
    this.conteinarWidth: 140.0,
  });
  var imageUrl = 'https://picsum.photos/140/200/';
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Container(
        width: this.conteinarWidth,
        height: this.conteinarHeight,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              print("Container clicked");
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                //color: Colors.white,
                image: DecorationImage(
                  //alignment: Alignment(-.2, 0),
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
