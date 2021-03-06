import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:snokscok/components/layout/appBar.dart';
import 'package:snokscok/components/background/lightBackground.dart';
import 'package:snokscok/screens/camera/components/camButton.dart';
import 'package:snokscok/screens/camera/components/miniPreview.dart';

import 'package:snokscok/com/services/tliteServices.dart';
import 'package:snokscok/com/services/cameraServices.dart';
import 'package:snokscok/com/services/mlkit.dart';
import 'package:snokscok/com/services/imageUtils.dart';
import 'package:snokscok/com/models/result.dart';

import 'package:image/image.dart' as imglib;

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
  MlKitServices _mlkitServices;

  bool camLoaded = false;
  List<Result> outputs;

  static int currentTimeInSeconds() {
    var ms = (new DateTime.now()).millisecondsSinceEpoch;
    return (ms / 1000).round();
  }

  var lastFrameProcess = currentTimeInSeconds();
  void onCameraInit({CameraController camera}) {
    camera.startImageStream((CameraImage cameraImage) {
      CameraService.isDetecting = true;
      try {
        // do your stuff
        var currentFrameProcess = currentTimeInSeconds();
        var processDiff = currentFrameProcess - lastFrameProcess;
        lastFrameProcess = currentFrameProcess;

        // Process one frame per second
        if (processDiff >= 1) {
          imglib.Image image = ImageUtils.convertImagetoPng(cameraImage);
          _mlkitServices.detectFromBinary(image);
          print(image);
        }
      } catch (e) {
        print(e);
      }
    });

    this.setState(() {
      camLoaded = true;
    });
  }

  void initState() {
    super.initState();

    //Initialize Camera
    CameraService.initializeCamera(callback: onCameraInit);

    this._mlkitServices = MlKitServices();
  }

  @override
  Widget build(BuildContext context) {
    if (!camLoaded) {
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
                      _buildBoundingBoxWidget(width, outputs)
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

  Widget _buildBoundingBoxWidget(double width, List<Result> outputs) {
    return Positioned.fill(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 200.0,
          width: width,
          decoration: BoxDecoration(
            color: Colors.transparent,
          ),
          child: outputs != null && outputs.isNotEmpty
              ? ListView.builder(
                  itemCount: outputs.length,
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(20.0),
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: <Widget>[
                        Text(
                          outputs[index].detectedClass,
                          style: TextStyle(
                            color: _colorTween.value,
                            fontSize: 20.0,
                          ),
                        ),
                        Text(
                          "${(outputs[index].confidenceInClass * 100.0).toStringAsFixed(2)} %",
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
    super.dispose();
  }
}
