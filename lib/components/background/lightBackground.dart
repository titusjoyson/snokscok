import 'package:flutter/material.dart';
import 'package:snokscok/themes/const.dart';



class LightBackground extends StatelessWidget {
  LightBackground({Key key, this.child, this.bottomNavigationBar}) : super(key: key);
  final Widget child;
  final Widget bottomNavigationBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallet.silk,
      body: Center(
          child: Container(
            decoration: BoxDecoration(
              gradient: BackgroundStyles.lgSilk
              //color: Pallet.brownDark,
            ),
            child: child,
          )
        ),
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}