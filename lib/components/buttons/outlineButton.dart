import 'package:flutter/material.dart';
import 'package:snokscok/themes/const.dart';

class ImageIconButton extends StatefulWidget {
  ImageIconButton({Key key, this.onPressed, this.text, this.iconImage})
      : super(key: key);
  final GestureTapCallback onPressed;
  final String text;
  final String iconImage;

  @override
  _ImageIconButton createState() => _ImageIconButton();
}

class _ImageIconButton extends State<ImageIconButton>
    with SingleTickerProviderStateMixin {
  bool loading = false;
  double _width = 240;
  double _height = 55;
  double _radius = 10;
  double _textLength = 163;

  void onPress() {
    setState(() {
      loading = !loading;
      if (loading) {
        _width = 55;
        _height = 55;
        _radius = 100;
      } else {
        _width = 240;
        _height = 55;
        _radius = 10;
      }
    });
  }

  List<Widget> _createChildren() {
    List<Widget> buttonList = [
      Container(
        width: 30,
        height: 30,
        child: Image(
          image: AssetImage(widget.iconImage),
          fit: BoxFit.fitHeight,
        ),
        padding: EdgeInsets.fromLTRB(0, 2, 0, 2),
      ),
    ];
    if (!loading) {
      buttonList.add(
        Container(
          width: _textLength,
          child: Text(
            widget.text,
            style: TextStyles.button,
          ),
          margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
        ),
      );
    }
    return buttonList;
  }

  EdgeInsets _getChildPadding(){
    if(loading){
      return EdgeInsets.all(0.0);
    }else{
      return EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 12.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: _width,
      height: _height,
      child: Material(
        borderRadius: BorderRadius.circular(_radius),
        child: InkWell(
          onTap: () {
            onPress();
          },
          child: Padding(
            padding: _getChildPadding(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: _createChildren(),
            ),
          ),
        ),
      ),
      duration: Duration(milliseconds: 100),
    );
  }
}
