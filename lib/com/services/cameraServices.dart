import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:snokscok/com/services/tliteServices.dart';

class CameraService {
  static CameraController camera;

  static bool isDetecting = false;
  static CameraLensDirection _direction = CameraLensDirection.back;
  static Future<void> initializeControllerFuture;

  static Future<CameraDescription> _getCamera(CameraLensDirection dir) async {
    return await availableCameras().then(
      (List<CameraDescription> cameras) => cameras.firstWhere(
        (CameraDescription camera) => camera.lensDirection == dir,
      ),
    );
  }

  static void initializeCamera() async {
    print("_initializeCamera: Initializing camera..");

    camera = CameraController(
        await _getCamera(_direction),
        defaultTargetPlatform == TargetPlatform.iOS
            ? ResolutionPreset.low
            : ResolutionPreset.medium,
        enableAudio: false);
    initializeControllerFuture = camera.initialize().then((value) {
      print("_initializeCamera: Camera initialized, starting camera stream..");

      camera.startImageStream((CameraImage image) {
        if (!TFLiteService.modelLoaded) return;
        if (isDetecting) return;
        isDetecting = true;
        try {
          TFLiteService.classifyImage(image);
        } catch (e) {
          print(e);
        }
      });
    });
  }
}
