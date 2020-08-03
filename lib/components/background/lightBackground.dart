import 'package:flutter/material.dart';
import 'package:snokscok/themes/const.dart';

class LightBackground extends StatelessWidget {
  LightBackground({Key key, this.child, this.bottomNavigationBar, this.appBar})
      : super(key: key);
  final Widget child;
  final Widget bottomNavigationBar;
  final Widget appBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: this.appBar,
      backgroundColor: Pallet.silk,
      body: Center(
        child: Container(
          padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
          decoration: BoxDecoration(
            gradient: BackgroundStyles.lgSilk,
          ),
          child: Center(child: child),
        ),
      ),
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
