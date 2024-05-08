import 'dart:developer';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CameraPhoto extends StatefulWidget {
  final CameraDescription camera1;
  final CameraDescription camera2;

  const CameraPhoto({
    super.key,
    required this.camera1,
    required this.camera2,
  });

  @override
  CameraPhotoState createState() => CameraPhotoState();
}

class CameraPhotoState extends State<CameraPhoto> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  int _currentCamera = 1;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(
      widget.camera1,
      ResolutionPreset.ultraHigh,
    );

    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Take a picture',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              setState(() {
                _currentCamera = _currentCamera == 1 ? 2 : 1;
                _controller = CameraController(
                  _currentCamera == 1 ? widget.camera1 : widget.camera2,
                  ResolutionPreset.ultraHigh,
                );
                _initializeControllerFuture = _controller.initialize();
              });
            },
            icon: AnimatedRotation(
              turns: _currentCamera == 1 ? 0 : 0.5,
              duration: const Duration(milliseconds: 600),
              child: Icon(
                Icons.flip_camera_android_rounded,
                color: _currentCamera == 1 ? Colors.white : Colors.yellow,
              ),
            ),
          ),
        ],
      ),
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return CameraPreview(_controller);
          } else {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 2,
              ),
            );
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(200)),
        ),
        onPressed: () async {
          setState(() {
            _isLoading = true;
          });

          try {
            await _initializeControllerFuture;

            _controller.setFlashMode(FlashMode.off);

            final image = await _controller.takePicture();

            setState(() {
              _isLoading = false;
            });

            if (!context.mounted) return;

            context.push('/editor', extra: image);
          } catch (e) {
            log("Error: $e");
          }
        },
        child: _isLoading
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.red,
                  semanticsLabel: 'Loading',
                  strokeWidth: 2,
                ),
              )
            : Icon(
                Icons.camera,
                color: Colors.black.withOpacity(0.3),
                size: 50,
              ),
      ),
    );
  }
}
