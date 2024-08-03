import 'package:camera/camera.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'components/welcome.dart';
import 'components/tips.dart';
import 'components/big_button.dart';
import '/imports.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool firstTime = SharedPrefs().prefs.getBool('welcome') ?? true;

  @override
  Widget build(BuildContext context) {
    if (firstTime) {
      return Welcome(
        onPressed: () {
          setState(() {
            firstTime = false;
          });
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        actions: const [Tips()],
        centerTitle: true,
        title: const Text(
          'Monophoto',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BigButton(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(35),
                topRight: Radius.circular(35),
              ),
              icon: Icons.folder,
              title: 'Image from Gallery',
              onTap: () async {
                final dynamic image = await ImagePicker().pickImage(
                  source: ImageSource.gallery,
                );

                if (image != null && context.mounted) {
                  context.push('/editor', extra: image);
                }
              },
            ),
            const SizedBox(height: 3),
            BigButton(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
              icon: Icons.camera_alt,
              title: 'Image from Camera',
              onTap: () async {
                final cameras = await availableCameras();

                final firstCamera = cameras.first;

                if (context.mounted) {
                  context.push('/camera', extra: firstCamera);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
