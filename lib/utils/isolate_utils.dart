import 'dart:isolate';

import 'package:camera/camera.dart';

class IsolateUtils {
  static const String DEBUG_NAME = "InferenceIsolate";

  late Isolate _isolate;
  final ReceivePort _receivePort = ReceivePort();
  late SendPort _sendPort;

  Isolate get isolate => _isolate;

  ReceivePort get receivePort => _receivePort;

  SendPort get sendPort => _sendPort;

  Future<void> startAsync() async {
    _isolate = await Isolate.spawn<SendPort>(entryPointAsync, _receivePort.sendPort, debugName: DEBUG_NAME);

    _sendPort = await _receivePort.first;
  }

  static Future<void> entryPointAsync(SendPort sendPort) async {
    final port = ReceivePort();
    sendPort.send(port);

    await for (final IsolateData isolateData in port) {

    }
  }
}

class IsolateData {
  CameraImage cameraImage;
  int interpreterAddress;
  List<String> labels;
  SendPort? responsePort;

  IsolateData(this.cameraImage, this.interpreterAddress, this.labels);
}