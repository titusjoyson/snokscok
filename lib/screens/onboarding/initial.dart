import 'package:flutter/material.dart';
import 'package:snokscok/themes/const.dart';
import 'package:snokscok/components/buttons/outlineButton.dart';
import 'package:snokscok/components/logo/svglog.dart';
import 'package:snokscok/components/logo/PngImage.dart';
import 'package:lottie/lottie.dart';


class PageText {
  static final String note = "Snap to find books and reviews,\n find people with similar intrest and exchange books. Stay updated with latest book feeds and articils.";
  static final String gdlogin = "SignIn with Goodreads  ▶";
  static final String loginNote = "Login / Create account";
  static final String stepAhead = "One step ahaid";
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _onGoodReadsLogin(){

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallet.silk,
      body: Center(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Pallet.silk, Pallet.silkDark]
              )
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
                          PngImage("assets/images/backgroundone.png"),
                        ]
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        ImageIconButton(
                            _onGoodReadsLogin,
                            PageText.gdlogin
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