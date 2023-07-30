import 'package:flutter/material.dart';
import 'editor.dart';

mixin EditorState<T extends ImageEditor> on State<T> {
  final GlobalKey globalKey = GlobalKey();

  bool showEdited = true;

  double colorFilterIntensity = 0;
  Color colorFilterColor = Colors.white;

  double softLightFilterIntensity = 0;
  Color softLightFilterColor = Colors.white;

  double saturationFilterIntensity = 0;
  Color saturationFilterColor = Colors.white;

  double hueFilterIntensity = 0;
  Color hueFilterColor = Colors.white;

  double overlayFilterIntensity = 0;
  Color overlayFilterColor = Colors.white;

  double multiplyFilterIntensity = 0;
  Color multiplyFilterColor = Colors.white;

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
}
