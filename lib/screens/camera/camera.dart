import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';
import 'package:snokscok/components/layout/appBar.dart';
import 'package:snokscok/components/background/lightBackground.dart';
import 'package:snokscok/screens/camera/cameraPreview.dart';
import 'package:snokscok/screens/camera/components/camButton.dart';
import 'package:snokscok/screens/camera/components/miniPreview.dart';

import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:snokscok/com/services/tliteServices.dart';
import 'package:snokscok/com/services/cameraServices.dart';
import 'package:snokscok/com/models/result.dart';

// A screen that allows users to take a picture using a given camera.
class TakePictureScreen extends StatefulWidget {
  const TakePictureScreen({Key key}) : super(key: key);

  @override
  TakePictureScreenState createState() => TakePictureScreenState();
}

class TakePictureScreenState extends State<TakePictureScreen>
    with TickerProviderStateMixin {
  AnimationController _colorAnimController;
  Animation _colorTween;

  List<Result> outputs;

  void initState() {
    super.initState();

    //Load TFLite Model
    TFLiteService.loadModel().then((value) {
      setState(() {
        TFLiteService.modelLoaded = true;
      });
    });

    //Initialize Camera
    CameraService.initializeCamera();

    //Setup Animation
    _setupAnimation();

    //Subscribe to TFLite's Classify events
    TFLiteService.tfLiteResultsController.stream.listen(
        (value) {
          value.forEach((element) {
            _colorAnimController.animateTo(element.confidence,
                curve: Curves.bounceIn, duration: Duration(milliseconds: 500));
          });

          //Set Results
          outputs = value;

          //Update results on screen
          setState(() {
            //Set bit to false to allow detection again
            CameraService.isDetecting = false;
          });
        },
        onDone: () {},
        onError: (error) {
          print(error);
        });
  }

  @override
  Widget build(BuildContext context) {
    if (TFLiteService.modelLoaded) {
      return LightBackground(
        appBar: TransparentAppBar(
          title: "Camera",
        ),
      );
    }
    double width = MediaQuery.of(context).size.width;

    return LightBackground(
      appBar: TransparentAppBar(
        title: "Camera",
      ),
      // Wait until the controller is initialized before displaying the
      // camera preview. Use a FutureBuilder to display a loading spinner
      // until the controller has finished initializing.
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: FutureBuilder<void>(
              future: CameraService.initializeControllerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  // If the Future is complete, display the preview.
                  return Stack(
                    children: <Widget>[
                      CameraPreview(CameraService.camera),
                      _buildResultsWidget(width, outputs)
                    ],
                  );
                } else {
                  // Otherwise, display a loading indicator.
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: MiniPreview(),
                ),
                Expanded(
                  flex: 1,
                  child: CameraButton(),
                ),
                Expanded(
                  flex: 1,
                  child: Container(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildResultsWidget(double width, List<Result> outputs) {
    return Positioned.fill(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 200.0,
          width: width,
          color: Colors.white,
          child: outputs != null && outputs.isNotEmpty
              ? ListView.builder(
                  itemCount: outputs.length,
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(20.0),
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: <Widget>[
                        Text(
                          outputs[index].label,
                          style: TextStyle(
                            color: _colorTween.value,
                            fontSize: 20.0,
                          ),
                        ),
                        AnimatedBuilder(
                            animation: _colorAnimController,
                            builder: (context, child) => LinearPercentIndicator(
                                  width: width * 0.88,
                                  lineHeight: 14.0,
                                  percent: outputs[index].confidence,
                                  progressColor: _colorTween.value,
                                )),
                        Text(
                          "${(outputs[index].confidence * 100.0).toStringAsFixed(2)} %",
                          style: TextStyle(
                            color: _colorTween.value,
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    );
                  })
              : Center(
                  child: Text("Wating for model to detect..",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                      ))),
        ),
      ),
    );
  }

  @override
  void dispose() {
    TFLiteService.disposeModel();
    CameraService.camera.dispose();
    print("dispose: Clear resources.");
    super.dispose();
  }

  void _setupAnimation() {
    _colorAnimController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _colorTween = ColorTween(begin: Colors.green, end: Colors.red)
        .animate(_colorAnimController);
  }
}
