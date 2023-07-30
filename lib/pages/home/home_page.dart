import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '/components/components.dart';
import '/core/core.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool firstTime = SharedPrefs().prefs.getBool('welcome') ?? true;
  dynamic imageEdit;

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

    if (imageEdit != null) {
      return ImageEditor(
        image: imageEdit,
        onClean: () {
          discardEdition(
            context: context,
            action: () {
              setState(() {
                imageEdit = null;
              });
            },
          );
        },
      );
    }

    return SelectImage(onSelectImage: (XFile image) {
      setState(() {
        imageEdit = image;
      });
    });
  }
}
