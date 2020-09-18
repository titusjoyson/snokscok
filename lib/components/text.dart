import 'package:flutter/widgets.dart';
import 'package:snokscok/themes/const.dart';

class Header extends StatelessWidget {
  final String title;
  final TextStyle style;
  final TextAlign textAlign;
  Header(this.title, {this.style, this.textAlign});

  TextStyle getStyle() {
    if (this.style != null) {
      return TextStyles.header.merge(this.style);
    } else {
      return TextStyles.header;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      this.title,
      style: getStyle(),
      textAlign: this.textAlign,
    );
  }
}

class SubHeader extends StatelessWidget {
  final String title;
  SubHeader(this.title);

  @override
  Widget build(BuildContext context) {
    return Text(
      this.title,
      style: TextStyles.subHeader,
    );
  }
}

class Caption extends StatelessWidget {
  final String title;
  Caption(this.title);

  @override
  Widget build(BuildContext context) {
    return Text(
      this.title,
      style: TextStyles.caption,
    );
  }
}

class BodyNormal extends StatelessWidget {
  final String text;
  BodyNormal(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      this.text,
      style: TextStyles.body,
    );
  }
}

class BodyLite extends StatelessWidget {
  final String text;
  BodyLite(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      this.text,
      style: TextStyles.bodyTwo,
    );
  }
}
