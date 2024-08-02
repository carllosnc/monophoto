import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'tips.dart';

class SelectImage extends StatelessWidget {
  const SelectImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Monophoto',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: const SingleChildScrollView(
        child: Tips(),
      ),
      bottomNavigationBar: Container(
        color: Colors.white.withOpacity(0.1),
        height: 130,
        child: Column(
          children: [
            ListTile(
              trailing: const Icon(Icons.folder),
              title: const Text('Select image from gallery'),
              onTap: () async {
                final dynamic image = await ImagePicker().pickImage(
                  source: ImageSource.gallery,
                );

                if (image != null && context.mounted) {
                  context.push('/editor', extra: image);
                }
              },
            ),
            Divider(
              height: 1,
              color: Colors.white.withOpacity(0.1),
            ),
            ListTile(
              trailing: const Icon(Icons.camera_alt),
              title: const Text('Select image from camera'),
              onTap: () async {
                final cameras = await availableCameras();

                final firstCamera = cameras.first;

                if (context.mounted) {
                  context.push('/camera', extra: firstCamera);
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
