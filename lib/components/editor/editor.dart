import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:share_plus/share_plus.dart';
import 'editor_actions.dart';

import 'editor_done.dart';
import 'editor_loading.dart';
import 'editor_reset_edition.dart';
import 'editor_toggle_image.dart';
import 'editor_state.dart';
import 'editor_presets.dart';

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

class ImageEditorState extends State<ImageEditor> with EditorEstateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 18, 18, 18),
      key: UniqueKey(),
      appBar: AppBar(
        //back button to home page
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            context.go('/');
          },
        ),
        surfaceTintColor: Colors.black,
        centerTitle: false,
        title: Text(
          showEdited == true ? 'Monophoto (edited)' : 'Monophoto (original)',
          style: const TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
        actions: [
          EditorResetEdition(
            onReset: resetFilters,
          ),
          EditorDone(
            onSave: () {
              saveImage(
                context: context,
                globalKey: globalKey,
                onLoading: imageIsLoading,
                onSaved: imageIsSaved,
              );
            },
            onShare: () {
              shareImage(
                context: context,
                globalKey: globalKey,
                onLoading: imageIsLoading,
                onSaved: imageIsSaved,
              );
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned(
            child: Wrap(
              direction: Axis.vertical,
              children: [
                if (showEdited == false)
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 100),
                    width: MediaQuery.of(context).size.width,
                    child: InteractiveViewer(
                      maxScale: 5,
                      minScale: 1,
                      child: Image.file(
                        File(widget.image.path),
                        fit: BoxFit.contain,
                        width: double.infinity,
                      ),
                    ),
                  ),
                if (showEdited == true)
                  RepaintBoundary(
                    key: globalKey,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 100),
                      width: MediaQuery.of(context).size.width,
                      child: ImageFiltered(
                        imageFilter: ImageFilter.blur(
                          sigmaX: blurFilterIntensity,
                          sigmaY: blurFilterIntensity,
                          tileMode: TileMode.mirror,
                        ),
                        child: ColorFiltered(
                          colorFilter: ColorFilter.mode(
                            hueFilterColor.withOpacity(hueFilterIntensity),
                            BlendMode.hue,
                          ),
                          child: ColorFiltered(
                            colorFilter: ColorFilter.mode(
                              highlightFilterColor.withOpacity(highlightFilterIntensity),
                              BlendMode.overlay,
                            ),
                            child: ColorFiltered(
                              colorFilter: ColorFilter.mode(
                                shadowFilterColor.withOpacity(shadowFilterIntensity),
                                BlendMode.softLight,
                              ),
                              child: ColorFiltered(
                                colorFilter: ColorFilter.mode(
                                  colorFilterColor.withOpacity(colorFilterIntensity),
                                  BlendMode.color,
                                ),
                                child: ColorFiltered(
                                  colorFilter: ColorFilter.mode(
                                    lightenFilterColor.withOpacity(lightenFilterIntensity),
                                    BlendMode.plus,
                                  ),
                                  child: ColorFiltered(
                                    colorFilter: ColorFilter.mode(
                                      darkenFilterColor.withOpacity(darkenFilterIntensity),
                                      BlendMode.multiply,
                                    ),
                                    child: InteractiveViewer(
                                      maxScale: 5,
                                      minScale: 1,
                                      child: Image.file(
                                        File(widget.image.path),
                                        fit: BoxFit.contain,
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
                    ),
                  ),
              ],
            ),
          ),
          if (savingImage == true) const EditorLoading(),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            EdtiorPreset(
              presets: [
                Preset('Black and white', blackAndWhitePreset),
                Preset('Solar', solar),
                Preset('Rainy', rainy),
                Preset('Greeny', greeny),
                Preset('Red', red),
              ],
            ),
            EditorToggleImage(
              onToggleEdited: toggleEdited,
              showEdited: showEdited,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.black,
        height: 80,
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //darken filter
            EditorFilter(
              canEditColor: false,
              initialColor: darkenFilterColor,
              initialIntensity: darkenFilterIntensity,
              icon: Icons.dark_mode,
              title: 'Darken',
              onSetIntensity: (double value) {
                setState(() {
                  darkenFilterIntensity = value;
                });
              },
              onSetColor: (Color value) {
                setState(() {
                  darkenFilterColor = value;
                });
              },
            ),

            //lighten filter
            EditorFilter(
              canEditColor: false,
              initialColor: lightenFilterColor,
              initialIntensity: lightenFilterIntensity,
              icon: Icons.light_mode,
              title: 'Lighten',
              onSetIntensity: (double value) {
                setState(() {
                  lightenFilterIntensity = value;
                });
              },
              onSetColor: (Color value) {
                setState(() {
                  lightenFilterColor = value;
                });
              },
            ),

            //shadow filter
            EditorFilter(
              canEditColor: false,
              initialColor: shadowFilterColor,
              initialIntensity: shadowFilterIntensity,
              icon: Icons.contrast,
              title: 'Shadow',
              onSetIntensity: (double value) {
                setState(() {
                  shadowFilterIntensity = value;
                });
              },
              onSetColor: (Color value) {
                setState(() {
                  shadowFilterColor = value;
                });
              },
            ),

            //highlight filter
            EditorFilter(
              canEditColor: false,
              initialColor: highlightFilterColor,
              initialIntensity: highlightFilterIntensity,
              icon: Icons.highlight,
              title: 'Highlight',
              onSetIntensity: (double value) {
                setState(() {
                  highlightFilterIntensity = value;
                });
              },
              onSetColor: (Color value) {
                setState(() {
                  highlightFilterColor = value;
                });
              },
            ),

            //color filter
            EditorFilter(
              canEditColor: true,
              initialColor: colorFilterColor,
              initialIntensity: colorFilterIntensity,
              icon: Icons.format_color_fill_rounded,
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

            //hue filter
            EditorFilter(
              canEditColor: true,
              initialColor: hueFilterColor,
              initialIntensity: hueFilterIntensity,
              icon: Icons.palette,
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

            //blur filter
            EditorFilter(
              maxIntensity: 2,
              canEditColor: false,
              initialColor: Colors.transparent,
              initialIntensity: blurFilterIntensity,
              icon: Icons.blur_on,
              title: 'Blur',
              onSetIntensity: (double value) {
                setState(() {
                  blurFilterIntensity = value;
                });
              },
              onSetColor: (Color value) {},
            ),
          ],
        ),
      ),
    );
  }
}
