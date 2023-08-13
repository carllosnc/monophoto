import 'dart:typed_data';
import 'dart:ui' as ui;
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:share_plus/share_plus.dart';

import '/core/core.dart';
import '/components/components.dart';

part 'editor_bottom.dart';
part 'editor_header.dart';
part 'editor_preview.dart';
part 'editor_toggle_button.dart';
part 'editor_render.dart';
part 'editor_final_actions.dart';
part 'editor_edition_actions.dart';

class ImageEditor extends StatefulWidget {
  final XFile image;
  final Function onClean;

  const ImageEditor({
    super.key,
    required this.image,
    required this.onClean,
  });

  @override
  State<ImageEditor> createState() => ImageEditorState();
}

class ImageEditorState extends State<ImageEditor> {
  final GlobalKey globalKey = GlobalKey();

  bool showEdited = true;
  bool savingImage = false;

  //image is loading

  imageIsLoading() {
    setState(() {
      savingImage = true;
    });
  }

  //image is saved

  imageIsSaved() {
    setState(() {
      savingImage = false;
    });
  }

  // toggle edited

  toggleEdited() {
    return setState(() {
      showEdited = !showEdited;
    });
  }

  //color filter

  double colorFilterIntensity = 0;
  Color colorFilterColor = Colors.white;

  setColorFilterColor(Color value) {
    setState(() {
      colorFilterColor = value;
    });
  }

  setColorFilterIntensity(double value) {
    setState(() {
      colorFilterIntensity = value;
    });
  }

  // soft ligth filter

  double softLightFilterIntensity = 0;
  Color softLightFilterColor = Colors.white;

  setSoftLightFilterColor(Color value) {
    setState(() {
      softLightFilterColor = value;
    });
  }

  setSoftLightFilterIntensity(double value) {
    setState(() {
      softLightFilterIntensity = value;
    });
  }

  // saturation filter

  double saturationFilterIntensity = 0;
  Color saturationFilterColor = Colors.white;

  setSaturationFilterColor(Color value) {
    setState(() {
      saturationFilterColor = value;
    });
  }

  setSaturationFilterIntensity(double value) {
    setState(() {
      saturationFilterIntensity = value;
    });
  }

  // hue filter

  double hueFilterIntensity = 0;
  Color hueFilterColor = Colors.white;

  setHueFilterColor(Color value) {
    setState(() {
      hueFilterColor = value;
    });
  }

  setHueFilterIntensity(double value) {
    setState(() {
      hueFilterIntensity = value;
    });
  }

  // overlay filter

  double overlayFilterIntensity = 0;
  Color overlayFilterColor = Colors.white;

  setOverlayFilterColor(Color value) {
    setState(() {
      overlayFilterColor = value;
    });
  }

  setOverlayFilterIntensity(double value) {
    setState(() {
      overlayFilterIntensity = value;
    });
  }

  // multiply filter

  double multiplyFilterIntensity = 0;
  Color multiplyFilterColor = Colors.white;

  setMultiplyFilterColor(Color value) {
    setState(() {
      multiplyFilterColor = value;
    });
  }

  setMultiplyFilterIntensity(double value) {
    setState(() {
      multiplyFilterIntensity = value;
    });
  }

  //reset filters

  resetFilters() {
    setState(() {
      colorFilterIntensity = 0;
      colorFilterColor = Colors.white;

      softLightFilterIntensity = 0;
      softLightFilterColor = Colors.white;

      saturationFilterIntensity = 0;
      saturationFilterColor = Colors.white;

      hueFilterIntensity = 0;
      hueFilterColor = Colors.white;

      overlayFilterIntensity = 0;
      overlayFilterColor = Colors.white;

      multiplyFilterIntensity = 0;
      multiplyFilterColor = Colors.white;
    });
  }

  @override
  Widget build(BuildContext context) {
    return render(context);
  }
}
