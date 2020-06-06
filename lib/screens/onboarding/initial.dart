import 'dart:async';
import 'package:flutter/material.dart';
import 'package:snokscok/themes/const.dart';
import 'package:snokscok/components/buttons/outlineButton.dart';
import 'package:snokscok/components/logo/svglog.dart';
import 'package:snokscok/components/logo/PngImage.dart';


class PageText {
  static final String note = "Snap to find books and reviews,\n find people with similar interest and exchange books. Stay updated with latest book feeds and articils.";
  static final String gdlogin = "SignIn with Goodreads  ▶";
  static final String stepAhead = "One step ahaid";
  static final String userAg = "Login / Create account";
}

class ImagesVar {
  static final String buttonImage = "assets/images/icons/goodreads-square-light.png";
  static final String logoImage = "assets/images/backgroundone.png";
}

class InitialPage extends StatefulWidget {
  InitialPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _InitialPageState createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {

  void _onGoodReadsLogin(event){
    if(!event.isLoading()){
      event.startLoading();
      new Future.delayed(new Duration(seconds: 3), () {
        return 100;
      }).then((value) {
        event.stopLoading();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallet.silk,
      body: Center(
          child: Container(
            decoration: BoxDecoration(
              gradient: BackgroundStyles.lgSilk
              //color: Pallet.brownDark,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  flex: 10,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    margin: EdgeInsets.fromLTRB(10.00, 40.00, 10.00, 10.00),
                    child:Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SVGLogo(),
                          Padding(
                            padding: EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 16.0),
                            child: Text(PageText.note, style: TextStyles.subHeader, textAlign: TextAlign.center),
                          ),
                          PngImage(ImagesVar.logoImage),
                        ]
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        LoadingIconButton(
                          onPress: _onGoodReadsLogin,
                          text: PageText.gdlogin,
                          iconImage: ImagesVar.buttonImage
                        ),
                      ]
                  ),
                ),
              ],
            ),
          )
        ),
    );
  }
}