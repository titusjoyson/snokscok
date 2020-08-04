import 'package:flutter/material.dart';
import 'package:snokscok/components/background/lightBackground.dart';
import 'package:snokscok/components/card.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:snokscok/components/text.dart';
import 'package:snokscok/components/layout/appBar.dart';

class ListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LightBackground(
      appBar: TransparentAppBar(title: "Recent Matches"),
      child: StaggeredGridView.countBuilder(
        crossAxisCount: 3,
        itemCount: 500,
        itemBuilder: (BuildContext context, int index) => CardWidget(),
        staggeredTileBuilder: (int index) => StaggeredTile.count(1, 1.5),
        mainAxisSpacing: 1.0,
        crossAxisSpacing: 1.0,
        padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
      ),
    );
  }
}
