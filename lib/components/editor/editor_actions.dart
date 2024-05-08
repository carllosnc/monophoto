import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:share_plus/share_plus.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

import '/core/core.dart';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import 'editor_snackbar.dart';

Future<Uint8List> captureWidget({
  required GlobalKey globalKey,
  required void Function() onLoading,
  required void Function() onSaved,
}) async {
  onLoading();

  final RenderRepaintBoundary boundary = globalKey.currentContext?.findRenderObject() as RenderRepaintBoundary;

  final ui.Image image = await boundary.toImage(pixelRatio: 3.0);

  final ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);

  final Uint8List pngBytes = byteData!.buffer.asUint8List();

  onSaved();

  return pngBytes;
}

saveImage({
  required BuildContext context,
  required GlobalKey globalKey,
  required void Function() onLoading,
  required void Function() onSaved,
}) async {
  Navigator.pop(context);

  try {
    onLoading();

    var result = await captureWidget(
      globalKey: globalKey,
      onLoading: onLoading,
      onSaved: onSaved,
    );

    await ImageGallerySaver.saveImage(
      result,
      name: "monophoto_${getRandomString(7)}",
      quality: 100,
    );

    onSaved();

    if (context.mounted) {
      editorSnackbar(
        message: 'Image saved',
        context: context,
      );
    }
  } catch (e) {
    onSaved();

    if (context.mounted) {
      editorSnackbar(
        message: 'Error saving image',
        isError: true,
        context: context,
      );
    }
  }
}

shareImage({
  required BuildContext context,
  required GlobalKey globalKey,
  required void Function() onLoading,
  required void Function() onSaved,
}) async {
  var result = await captureWidget(
    globalKey: globalKey,
    onLoading: onLoading,
    onSaved: onSaved,
  );

  Share.shareXFiles([
    XFile.fromData(
      result,
      name: "monophoto_${getRandomString(7)}",
      mimeType: 'image/png',
    )
  ]);
}
