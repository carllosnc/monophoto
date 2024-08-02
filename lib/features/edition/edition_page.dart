import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'components/editor/editor.dart';

class EditionPage extends StatefulWidget {
  final XFile image;
  const EditionPage({super.key, required this.image});

  @override
  State<EditionPage> createState() => _EditionPageState();
}

class _EditionPageState extends State<EditionPage> {
  @override
  Widget build(BuildContext context) {
    return ImageEditor(image: widget.image, onClean: () {});
  }
}
