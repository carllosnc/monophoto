import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import '/components/components.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({
    super.key,
  });

  @override
  CameraPageState createState() => CameraPageState();
}

class CameraPageState extends State<CameraPage> {
  late CameraDescription _camera1;
  late CameraDescription _camera2;
  bool _isLoading = true;

  loadCamera() async {
    final cameras = await availableCameras();

    setState(() {
      _camera1 = cameras.first;
      _camera2 = cameras.last;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();

    loadCamera();
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Loading...'),
        ),
        body: Container(
          color: Colors.black,
        ),
      );
    } else {
      return CameraPhoto(
        camera1: _camera1,
        camera2: _camera2,
      );
    }
  }
}
