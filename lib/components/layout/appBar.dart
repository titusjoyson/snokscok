import 'package:flutter/material.dart';
import 'package:snokscok/themes/const.dart';

class TransparentAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  TransparentAppBar({Key key, this.title})
      : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: new Text(
        this.title,
        style: TextStyle(color: Pallet.sasBlack),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      iconTheme: IconThemeData(
        color: Pallet.sasBlack, //change your color here
      ),
    );
  }
}
