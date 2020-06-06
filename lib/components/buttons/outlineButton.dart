import 'package:flutter/material.dart';
import 'package:snokscok/themes/const.dart';

class LoadingIconButton extends StatefulWidget {
  LoadingIconButton({Key key, this.onPress, this.text, this.iconImage})
      : super(key: key);
  final Function onPress;
  final String text;
  final String iconImage;

  @override
  _LoadingIconButton createState() => _LoadingIconButton();
}

class _LoadingIconButton extends State<LoadingIconButton> {
  Color _disableColor;
  bool _disabild = false;
  bool _loading = false;
  bool _showLoader = false;

  // layout and animation variabils
  
  static double _startWidth = 240;
  static double _endWidth = 55;
  double _width = _startWidth;
  static double _startHeight = 55;
  static double _endHeight = 55;
  double _height = _startHeight;
  static double _startRadius = 10;
  static double _endRadius = 100;
  double _radius = _startRadius;

  bool isLoading(){
    return _loading;
  }

  void disableButton(){
    setState(() {
      _disabild = true;
      _disableColor = Colors.transparent;
    });
  }

  void enableButton(){
    setState(() {
      _disabild = false;
      _disableColor = null;
    });
  }

  void startLoading(){
    disableButton();
    setState(() {
      _loading = true;
      _width = _endWidth;
      _radius = _endRadius;
    });
  }

  void stopLoading(){
    enableButton();
    setState(() {
      _loading = false;
      _showLoader = false;
      _width = _startWidth;
      _radius = _startRadius;
    });
  }

  void onPress() {
    widget.onPress(this);
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
      )
    ];
    if (!_loading) {
      buttonList.add(
        Container(
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

  Widget progressIndicator = CircularProgressIndicator(
    backgroundColor: Colors.transparent,
    valueColor: new AlwaysStoppedAnimation<Color>(Pallet.shabbyRed),
    strokeWidth: 10,
  );

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedContainer(
          width: _width + 10,
          height: _height + 10,
          padding: EdgeInsets.all(5),
          child: _showLoader ? progressIndicator : Column(),
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOutBack,
        ),
        Positioned(
          left: 5,
          top: 5,
          child: AnimatedContainer(
            width: _width,
            height: _height,
            child: Material(
              borderRadius: BorderRadius.circular(_radius),
              child: InkWell(
                splashColor: _disableColor,
                highlightColor: _disableColor,
                onTap: () {
                  onPress();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: _createChildren(),
                ),
              ),
            ),
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOutBack,
            onEnd: () {
              if (_loading) {
                setState(() {
                  _showLoader = true;
                });
              }
            },
          ),
        ),
      ],
    );
  }
}
