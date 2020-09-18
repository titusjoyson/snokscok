import 'package:flutter/material.dart';
import 'package:snokscok/components/text.dart';

class HorizontalList extends StatelessWidget {
  HorizontalList({
    this.onViewMorePress,
    this.title: "",
    this.containerHeight: 220.0,
    this.showMore: false,
    this.cards,
  });

  List<Map> list() => [];

  final title;
  final containerHeight;
  final bool showMore;
  final Function onViewMorePress;
  final List<Widget> cards;

  Widget _buildTitle() {
    if (this.title == "" || this.showMore == false) {
      return null;
    } else {
      return Container(
        margin: EdgeInsets.fromLTRB(12, 0, 5, 20),
        height: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            this.title != "" ? SubHeader(title) : null,
            showMore
                ? FlatButton(
                    onPressed: this.onViewMorePress,
                    padding: EdgeInsets.all(0),
                    child: Caption("View More"),
                  )
                : null
          ].where((child) => child != null).toList(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          this._buildTitle(),
          Container(
            height: this.containerHeight,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: cards,
            ),
          ),
        ].where((child) => child != null).toList(),
      ),
    );
  }
}
