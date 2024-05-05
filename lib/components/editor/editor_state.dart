import 'package:flutter/material.dart';

mixin EditorEstateMixin<T extends StatefulWidget> on State<T> {
  final GlobalKey globalKey = GlobalKey();

  // darken filter
  double darkenFilterIntensity = 0;
  Color darkenFilterColor = Colors.black;

  // lighten filter
  double lightenFilterIntensity = 0;
  Color lightenFilterColor = Colors.white;

  // color filter
  double colorFilterIntensity = 0;
  Color colorFilterColor = Colors.white;

  // shadow filter
  double shadowFilterIntensity = 0;
  Color shadowFilterColor = Colors.black;

  // highlight filter
  double highlightFilterIntensity = 0;
  Color highlightFilterColor = Colors.white;

  // hue filter
  double hueFilterIntensity = 0;
  Color hueFilterColor = Colors.white;

  // blur filter
  double blurFilterIntensity = 0;

  resetFilters() {
    setState(() {
      darkenFilterIntensity = 0;
      darkenFilterColor = Colors.black;

      lightenFilterIntensity = 0;
      lightenFilterColor = Colors.white;

      colorFilterIntensity = 0;
      colorFilterColor = Colors.white;

      shadowFilterIntensity = 0;
      shadowFilterColor = Colors.black;

      highlightFilterIntensity = 0;
      highlightFilterColor = Colors.white;

      hueFilterIntensity = 0;
      hueFilterColor = Colors.white;

      blurFilterIntensity = 0;
    });
  }

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

  //presets
  blackAndWhitePreset() {
    resetFilters();

    setState(() {
      shadowFilterIntensity = 0.53;
      highlightFilterIntensity = 0.48;
      darkenFilterIntensity = 0.11;
      colorFilterIntensity = 1.00;
      colorFilterColor = Colors.black;
      hueFilterIntensity = 1.00;
      hueFilterColor = Colors.white;
    });
  }

  solar() {
    resetFilters();

    setState(() {
      darkenFilterIntensity = 0.04;
      shadowFilterIntensity = 0.35;
      highlightFilterIntensity = 0.25;
      colorFilterColor = Colors.yellow.shade900;
      colorFilterIntensity = 0.41;
    });
  }

  rainy() {
    resetFilters();

    setState(() {
      darkenFilterIntensity = 0.10;
      shadowFilterIntensity = 0.40;
      highlightFilterIntensity = 0.10;
      colorFilterColor = Colors.blue.shade700;
      colorFilterIntensity = 0.35;
      hueFilterColor = Colors.indigo.shade700;
      hueFilterIntensity = 0.48;
    });
  }

  greeny() {
    resetFilters();

    setState(() {
      shadowFilterIntensity = 0.19;
      colorFilterColor = Colors.green.shade500;
      colorFilterIntensity = 0.29;
      hueFilterColor = Colors.green.shade300;
      hueFilterIntensity = 0.18;
    });
  }
}
