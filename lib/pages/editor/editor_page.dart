import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '/imports.dart';

class EditorPage extends StatefulWidget {
  final XFile image;
  const EditorPage({super.key, required this.image});

  @override
  State<EditorPage> createState() => _EditorPageState();
}

class _EditorPageState extends State<EditorPage> {
  @override
  Widget build(BuildContext context) {
    return ImageEditor(image: widget.image, onClean: () {});
  }
}
