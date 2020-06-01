import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class SVGLogo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset("assets/images/icons/logonamepath.svg");
  }
}