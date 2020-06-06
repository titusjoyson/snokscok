import 'package:flutter/material.dart';
import 'package:snokscok/themes/const.dart';
import 'package:snokscok/components/buttons/outlineButton.dart';
import 'package:snokscok/components/logo/svglog.dart';


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
      appBar: AppBar(
        title: Text(""),
        elevation: 0.0,
        backgroundColor: Pallet.silk,
      ),
      body: Container(
        decoration: BoxDecoration(
        ),
        child: Center(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              SVGLogo(),
              Text("One click to continue", style: TextStyles.header,),
              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ImageIconButton(
                        _onGoodReadsLogin,
                        "SignIn with GoodReads"
                    ),
                    Text("Login / Create account", style: TextStyles.caption,)
                  ]
              ),
            ],
          ),
        ),
      ),
    );
  }
}