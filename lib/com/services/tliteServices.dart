import 'dart:async';

import 'package:camera/camera.dart';
import 'package:tflite/tflite.dart';
import 'package:snokscok/com/models/result.dart';

class TFLiteService {
  static StreamController<List<Result>> tfLiteResultsController =
      new StreamController.broadcast();
  static List<Result> _outputs = List();
  static var modelLoaded = false;

  static Future<String> loadModel() async {
    print("loadModel: Loading model..");
    return Tflite.loadModel(
        model: "assets/tflite/detect.tflite",
        labels: "assets/tflite/labelmap.txt",
        numThreads: 2, // defaults to 1
        isAsset:
            true, // defaults to true, set to false to load resources outside assets
        useGpuDelegate:
            false // defaults to false, set to true to use GPU delegate
        );
  }

  static detectObjectOnFrame(CameraImage image) async {
    await Tflite.detectObjectOnFrame(
      bytesList: image.planes.map((plane) {
        return plane.bytes;
      }).toList(), // required
      model: "SSDMobileNet",
      imageHeight: image.height,
      imageWidth: image.width,
      imageMean: 127.5, // defaults to 127.5
      imageStd: 127.5, // defaults to 127.5
      rotation: 90, // defaults to 90, Android only
      threshold: 0.6, // defaults to 0.1
      asynch: true,
    ).then((value) {
      if (value.isNotEmpty) {
        //Clear previous results
        _outputs.clear();

        value.forEach((element) {
          _outputs.add(
            Result(
              element['confidenceInClass'],
              element['detectedClass'],
              Rec(element['x'], element['y'], element['w'], element['h']),
            ),
          );

          print(
              "${element['confidenceInClass']} , ${element['detectedClass']}");
        });
      }

      //Sort results according to most confidence
      _outputs
          .sort((a, b) => a.confidenceInClass.compareTo(b.confidenceInClass));

      //Send results
      tfLiteResultsController.add(_outputs);
    });
  }

  static classifyImage(CameraImage image) async {
    TFLiteService.detectObjectOnFrame(image);
  }

  static void disposeModel() {
    Tflite.close();
    tfLiteResultsController.close();
  }
}
