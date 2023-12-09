import 'dart:typed_data';
import 'dart:ui' as ui;
import 'dart:io';

import '/core/core.dart';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:share_plus/share_plus.dart';

import 'edited_badge.dart';
import 'edition_done.dart';
import 'loading.dart';
import 'remove_image.dart';
import 'reset_edition.dart';
import 'toggle_edited_image.dart';

import '/components/components.dart';

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

  // Colors filter
  double colorFilterIntensity = 0;
  Color colorFilterColor = Colors.white;

  // Soft light filter
  double softLightFilterIntensity = 0;
  Color softLightFilterColor = Colors.white;

  // Saturation filter
  double saturationFilterIntensity = 0;
  Color saturationFilterColor = Colors.white;

  // Hue filter
  double hueFilterIntensity = 0;
  Color hueFilterColor = Colors.white;

  // Overlay filter
  double overlayFilterIntensity = 0;
  Color overlayFilterColor = Colors.white;

  // Multiply filter
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

  void showSnackbar({required String message, bool isError = false}) {
    Color success = const Color.fromARGB(255, 6, 105, 9);
    Color error = Colors.red;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(
            fontFamily: 'SFProDisplay',
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        backgroundColor: isError ? error : success,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  Future<Uint8List> captureWidget() async {
    imageIsLoading();

    final RenderRepaintBoundary boundary = globalKey.currentContext?.findRenderObject() as RenderRepaintBoundary;

    final ui.Image image = await boundary.toImage(pixelRatio: 3.0);

    final ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);

    final Uint8List pngBytes = byteData!.buffer.asUint8List();

    imageIsSaved();

    return pngBytes;
  }

  saveImage() async {
    Navigator.pop(context);

    try {
      imageIsLoading();

      var result = await captureWidget();

      await ImageGallerySaver.saveImage(
        result,
        name: "monophoto_${getRandomString(7)}",
        quality: 100,
      );

      imageIsSaved();

      showSnackbar(message: 'Image saved');
    } catch (e) {
      imageIsSaved();

      showSnackbar(message: 'Error saving image', isError: true);
    }
  }

  shareImage() async {
    var result = await captureWidget();

    Share.shareXFiles([
      XFile.fromData(
        result,
        name: "monophoto_${getRandomString(7)}",
        mimeType: 'image/png',
      )
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: UniqueKey(),
      appBar: AppBar(
        surfaceTintColor: Colors.black,
        centerTitle: false,
        title: const Text(
          'Monophoto',
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
        actions: [
          RemoveImage(
            onClean: widget.onClean,
          ),
          ResetEdition(
            onReset: resetFilters,
          ),
          EditionDone(
            onSave: saveImage,
            onShare: shareImage,
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: InteractiveViewer(
              maxScale: 3.0,
              minScale: 1.0,
              constrained: true,
              child: Wrap(
                direction: Axis.vertical,
                children: [
                  if (showEdited == false)
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 100),
                      width: MediaQuery.of(context).size.width,
                      child: Image.file(
                        File(widget.image.path),
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                  if (showEdited == true)
                    RepaintBoundary(
                      key: globalKey,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 100),
                        width: MediaQuery.of(context).size.width,
                        child: ColorFiltered(
                          colorFilter: ColorFilter.mode(
                            multiplyFilterColor.withOpacity(multiplyFilterIntensity),
                            BlendMode.multiply,
                          ),
                          child: ColorFiltered(
                            colorFilter: ColorFilter.mode(
                              overlayFilterColor.withOpacity(overlayFilterIntensity),
                              BlendMode.overlay,
                            ),
                            child: ColorFiltered(
                              colorFilter: ColorFilter.mode(
                                hueFilterColor.withOpacity(hueFilterIntensity),
                                BlendMode.hue,
                              ),
                              child: ColorFiltered(
                                colorFilter: ColorFilter.mode(
                                  saturationFilterColor.withOpacity(saturationFilterIntensity),
                                  BlendMode.saturation,
                                ),
                                child: ColorFiltered(
                                  colorFilter: ColorFilter.mode(
                                    softLightFilterColor.withOpacity(softLightFilterIntensity),
                                    BlendMode.softLight,
                                  ),
                                  child: ColorFiltered(
                                    colorFilter: ColorFilter.mode(
                                      colorFilterColor.withOpacity(colorFilterIntensity),
                                      BlendMode.color,
                                    ),
                                    child: Image.file(
                                      File(widget.image.path),
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          EditedBadge(showEdited: showEdited),
          if (savingImage == true) const Loading(),
        ],
      ),
      floatingActionButton: ToggleEditedImage(
        onToggleEdited: toggleEdited,
        showEdited: showEdited,
      ),
      bottomNavigationBar: Container(
        color: Colors.black,
        height: 70,
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //color filter
            FilterButton(
              initialColor: colorFilterColor,
              initialIntensity: colorFilterIntensity,
              icon: Icons.format_color_fill,
              title: 'Color',
              onSetIntensity: (double value) {
                setState(() {
                  colorFilterIntensity = value;
                });
              },
              onSetColor: (Color value) {
                setState(() {
                  colorFilterColor = value;
                });
              },
            ),
            //soft light
            FilterButton(
              initialColor: softLightFilterColor,
              initialIntensity: softLightFilterIntensity,
              icon: Icons.lightbulb,
              title: 'Soft light',
              onSetIntensity: (double value) {
                setState(() {
                  softLightFilterIntensity = value;
                });
              },
              onSetColor: (Color value) {
                setState(() {
                  softLightFilterColor = value;
                });
              },
            ),
            //saturation
            FilterButton(
              initialColor: saturationFilterColor,
              initialIntensity: saturationFilterIntensity,
              icon: Icons.contrast,
              title: 'Saturation',
              onSetIntensity: (double value) {
                setState(() {
                  saturationFilterIntensity = value;
                });
              },
              onSetColor: (Color value) {
                setState(() {
                  saturationFilterColor = value;
                });
              },
            ),
            //hue
            FilterButton(
              initialColor: hueFilterColor,
              initialIntensity: hueFilterIntensity,
              icon: Icons.colorize,
              title: 'Hue',
              onSetIntensity: (double value) {
                setState(() {
                  hueFilterIntensity = value;
                });
              },
              onSetColor: (Color value) {
                setState(() {
                  hueFilterColor = value;
                });
              },
            ),
            //overlay
            FilterButton(
              initialColor: overlayFilterColor,
              initialIntensity: overlayFilterIntensity,
              icon: Icons.layers,
              title: 'Overlay',
              onSetIntensity: (double value) {
                setState(() {
                  overlayFilterIntensity = value;
                });
              },
              onSetColor: (Color value) {
                setState(() {
                  overlayFilterColor = value;
                });
              },
            ),
            //multiply
            FilterButton(
              initialColor: multiplyFilterColor,
              initialIntensity: multiplyFilterIntensity,
              icon: Icons.auto_awesome_motion_sharp,
              title: 'Multiply',
              onSetIntensity: (double value) {
                setState(() {
                  multiplyFilterIntensity = value;
                });
              },
              onSetColor: (Color value) {
                setState(() {
                  multiplyFilterColor = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
