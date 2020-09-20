import 'dart:typed_data';

import 'package:mlkit/mlkit.dart';
import 'package:image/image.dart' as imglib;

class MlKitServices {
  FirebaseModelInterpreter interpreter = FirebaseModelInterpreter.instance;
  FirebaseModelManager manager = FirebaseModelManager.instance;
  FirebaseVisionTextDetector detector = FirebaseVisionTextDetector.instance;

  MlKitServices() {
    // //Register Cloud Model
    // manager.registerRemoteModelSource(
    //     FirebaseRemoteModelSource(modelName: "mobilenet_v1_224_quant"));

    // //Register Local Backup
    // manager.registerLocalModelSource(FirebaseLocalModelSource(
    //     modelName: 'mobilenet_v1_224_quant',
    //     assetFilePath: 'ml/mobilenet_v1_224_quant.tflite'));
  }

  Future detectFromBinary(imglib.Image image) async {
    try {
      print(1);
      Uint8List unit8Image = image.getBytes();
      print(2);

      List<VisionText> currentLabels =
          await detector.detectFromBinary(unit8Image);
      print(3);
      print(currentLabels);
    } catch (e) {
      print(e);
    }
    // Detect from binary data of a file/image
  }

  // int model
  Uint8List imageToByteList(imglib.Image image) {
    var _inputSize = 224;
    var convertedBytes = new Uint8List(1 * _inputSize * _inputSize * 3);
    var buffer = new ByteData.view(convertedBytes.buffer);
    int pixelIndex = 0;
    for (var i = 0; i < _inputSize; i++) {
      for (var j = 0; j < _inputSize; j++) {
        var pixel = image.getPixel(i, j);
        buffer.setUint8(pixelIndex, (pixel >> 16) & 0xFF);
        pixelIndex++;
        buffer.setUint8(pixelIndex, (pixel >> 8) & 0xFF);
        pixelIndex++;
        buffer.setUint8(pixelIndex, (pixel) & 0xFF);
        pixelIndex++;
      }
    }
    return convertedBytes;
  }

  // float model
  // Uint8List imageToByteList(imglib.Image image) {
  //   var _inputSize = 224;
  //   var convertedBytes = Float32List(1 * _inputSize * _inputSize * 3);
  //   var buffer = Float32List.view(convertedBytes.buffer);
  //   int pixelIndex = 0;
  //   for (var i = 0; i < _inputSize; i++) {
  //     for (var j = 0; j < _inputSize; j++) {
  //       var pixel = image.getPixel(i, j);
  //       buffer[pixelIndex] = ((pixel >> 16) & 0xFF) / 255;
  //       pixelIndex += 1;
  //       buffer[pixelIndex] = ((pixel >> 8) & 0xFF) / 255;
  //       pixelIndex += 1;
  //       buffer[pixelIndex] = ((pixel) & 0xFF) / 255;
  //       pixelIndex += 1;
  //     }
  //   }
  //   return convertedBytes.buffer.asUint8List();
  // }
}
