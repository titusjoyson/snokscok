import 'package:flutter/widgets.dart';
import 'package:snokscok/themes/const.dart';

class Header extends StatelessWidget {
  final String title;
  Header(this.title);

  @override
  Widget build(BuildContext context) {
    return Text(
      this.title,
      style: TextStyles.header,
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
