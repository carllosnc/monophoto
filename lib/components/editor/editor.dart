import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import './editor_state.dart';
import './editor_bottom.dart';
import './editor_header.dart';
import './editor_image.dart';
import './editor_toggle_button.dart';

class ImageEditor extends StatefulWidget {
  final XFile image;
  final Function onClean;

  const ImageEditor({
    super.key,
    required this.image,
    required this.onClean,
  });

  @override
  State<ImageEditor> createState() => _ImageEditorState();
}

class _ImageEditorState extends State<ImageEditor>
    with
        EditorState,
        EditorBottom,
        EditorHeader,
        EditorImage,
        EditorToggleButton {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: UniqueKey(),
      appBar: header(),
      body: editorImage(context),
      floatingActionButton: toggleButton(),
      bottomNavigationBar: bottomNavigation(),
    );
  }
}
