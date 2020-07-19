import 'dart:math';
import 'package:flutter/material.dart';
import 'package:snokscok/themes/const.dart';
import 'package:snokscok/components/buttons/cameraNavButton.dart';

class CardWidget extends StatelessWidget {
  static var rng = new Random();

  @override
  Widget build(BuildContext context) {
    var rngCount = rng.nextInt(10).toString();
    var imageUrl = 'https://picsum.photos/140/200/?rand=$rngCount';

    return Container(
      width: 160.0,
      padding: EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.red,
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
    );
  }
}

class HorizontalList extends StatelessWidget {
  HorizontalList({this.title = "", this.containerHeight = 220.0});

  final title;
  final containerHeight;

  Widget _buildTitle() {
    if (this.title == "") {
      return null;
    } else {
      return Container(
        margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
        child: Text(
          title,
          style: TextStyles.subHeader,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          this._buildTitle(),
          Container(
            height: this.containerHeight,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                CardWidget(),
                CardWidget(),
                CardWidget(),
                CardWidget(),
                CardWidget(),
                CardWidget(),
              ],
            ),
          ),
        ].where((child) => child != null).toList(),
      ),
    );
  }
}

class RecentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(height: 20),
          HorizontalList(
            title: "Recent Snaps",
          ),
          HorizontalList(
            title: "Recent suggections",
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CameraNavButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
