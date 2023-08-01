import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_starter/core/core.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:share_plus/share_plus.dart';
import './editor_state.dart';

mixin EditorHeader on EditorState {
  Future<Uint8List> captureWidget() async {
    setState(() {
      savingImage = true;
    });

    final RenderRepaintBoundary boundary =
        globalKey.currentContext?.findRenderObject() as RenderRepaintBoundary;

    final ui.Image image = await boundary.toImage(pixelRatio: 3.0);

    final ByteData? byteData =
        await image.toByteData(format: ui.ImageByteFormat.png);

    final Uint8List pngBytes = byteData!.buffer.asUint8List();

    setState(() {
      savingImage = false;
    });

    return pngBytes;
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

  saveImage() async {
    Navigator.pop(context);

    try {
      setState(() {
        savingImage = true;
      });

      var result = await captureWidget();

      await ImageGallerySaver.saveImage(
        result,
        name: "monophoto_${getRandomString(7)}",
        quality: 100,
      );

      setState(() {
        savingImage = false;
      });

      showSnackbar(message: 'Image saved');
    } catch (e) {
      setState(() {
        savingImage = false;
      });

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

  void editionDone(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SizedBox(
          height: 170,
          child: Column(
            children: [
              ListTile(
                onTap: () async {
                  await saveImage();
                },
                trailing: const Icon(
                  Icons.save,
                  color: Colors.white,
                ),
                title: const Text(
                  'Save',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Divider(color: Colors.white.withOpacity(0.1), height: 1),
              ListTile(
                onTap: () async {
                  await shareImage();
                },
                trailing: const Icon(
                  Icons.share,
                  color: Colors.white,
                ),
                title: const Text(
                  'Share',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void resetAction() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'Reset Edition',
            style: TextStyle(fontFamily: 'SFProDisplay'),
          ),
          content: const Text(
            'Are you sure to discard the current edition?',
            style: TextStyle(fontFamily: 'SFProDisplay'),
          ),
          actions: [
            OutlinedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'No',
                style: TextStyle(color: Colors.white),
              ),
            ),
            OutlinedButton(
              onPressed: () {
                resetFilters();

                Navigator.pop(context);
              },
              child: const Text(
                'Yes',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }

  AppBar header() {
    return AppBar(
      surfaceTintColor: Colors.black,
      centerTitle: false,
      title: const Text(
        'Monophoto',
        style: TextStyle(fontSize: 18, color: Colors.white),
      ),
      actions: [
        IconButton(
          icon: const Icon(
            Icons.close,
            color: Colors.red,
          ),
          onPressed: () {
            widget.onClean();
          },
        ),
        IconButton(
          icon: const Icon(
            Icons.refresh,
            color: Colors.white,
          ),
          onPressed: resetAction,
        ),
        //done icon
        IconButton(
          icon: const Icon(
            Icons.done,
            color: Colors.white,
          ),
          onPressed: () {
            editionDone(context);
          },
        ),
      ],
    );
  }
}
