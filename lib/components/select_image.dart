import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SelectImage extends StatelessWidget {
  final Function(XFile image) onSelectImage;

  const SelectImage({
    super.key,
    required this.onSelectImage,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Monophoto',
          style: TextStyle(fontSize: 18),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: 300,
            //border white
            decoration: BoxDecoration(
              color: Colors.black,
              border: Border.all(
                color: Colors.white.withOpacity(0.4),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  iconSize: 60,
                  padding: const EdgeInsets.all(20),
                  icon: const Icon(Icons.image, color: Colors.white),
                  onPressed: () async {
                    final dynamic image = await ImagePicker().pickImage(
                      source: ImageSource.gallery,
                    );

                    if (image != null) {
                      onSelectImage(image);
                    }
                  },
                ),
                const SizedBox(height: 5),
                const Text('Select image')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
