import 'package:flutter/material.dart';
import 'package:snokscok/components/background/lightBackground.dart';
import 'package:snokscok/components/card.dart';

class ListScreen extends StatelessWidget {
  final items = List<String>.generate(5, (i) => "Item $i");

  @override
  Widget build(BuildContext context) {
    return LightBackground(
      child: ListView.builder(
        padding: EdgeInsets.all(5),
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          return WideCardWidget();
        },
      ),
    );
  }
}
