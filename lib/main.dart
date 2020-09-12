import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:snokscok/screens/onboarding/initial.dart';
import 'package:snokscok/themes/const.dart';
import 'package:snokscok/screens/home/home.dart';
import 'package:snokscok/screens/listscreen/listScreen.dart';
import 'package:snokscok/screens/camera/camera.dart';
import 'package:snokscok/screens/camera/cameraPreview.dart';
import 'package:snokscok/screens/itemDetails/itemDetails.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Pallet.sasBlack));
    return MaterialApp(
      title: 'Snokscok',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: 'itemDetails',
      routes: {
        'initial': (context) => InitialPage(title: 'Snokscok On board'),
        'home': (context) => HomePage(title: 'Home Page'),
        "listScreen": (context) => ListScreen(),
        "camera": (context) => TakePictureScreen(),
        "cameraPreview": (context) => DisplayPictureScreen(),
        "itemDetails": (context) => ItemDetails(),
      },
    );
  }
}
