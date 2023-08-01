import 'dart:io';

import 'package:flutter/material.dart';
import 'editor_state.dart';

mixin EditorImage on EditorState {
  Positioned editedBadge() {
    return Positioned(
      top: 10,
      left: 10,
      child: Container(
        clipBehavior: Clip.hardEdge,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.5),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          showEdited == true ? 'Edited' : 'Original',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
      ),
    );
  }

  Positioned imageIsSaving() {
    return const Positioned(
      top: 15,
      right: 15,
      child: SizedBox(
        width: 25,
        height: 25,
        child: CircularProgressIndicator(
          backgroundColor: Colors.white,
          strokeWidth: 2,
          color: Colors.black,
        ),
      ),
    );
  }

  Stack editorImage(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: Wrap(
            direction: Axis.vertical,
            verticalDirection: VerticalDirection.up,
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
                        multiplyFilterColor
                            .withOpacity(multiplyFilterIntensity),
                        BlendMode.multiply,
                      ),
                      child: ColorFiltered(
                        colorFilter: ColorFilter.mode(
                          overlayFilterColor
                              .withOpacity(overlayFilterIntensity),
                          BlendMode.overlay,
                        ),
                        child: ColorFiltered(
                          colorFilter: ColorFilter.mode(
                            hueFilterColor.withOpacity(hueFilterIntensity),
                            BlendMode.hue,
                          ),
                          child: ColorFiltered(
                            colorFilter: ColorFilter.mode(
                              saturationFilterColor
                                  .withOpacity(saturationFilterIntensity),
                              BlendMode.saturation,
                            ),
                            child: ColorFiltered(
                              colorFilter: ColorFilter.mode(
                                softLightFilterColor
                                    .withOpacity(softLightFilterIntensity),
                                BlendMode.softLight,
                              ),
                              child: ColorFiltered(
                                colorFilter: ColorFilter.mode(
                                  colorFilterColor
                                      .withOpacity(colorFilterIntensity),
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
        editedBadge(),
        if (savingImage == true) imageIsSaving(),
      ],
    );
  }
}
