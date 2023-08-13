part of 'editor.dart';

extension EditorFinalActions on ImageEditorState {
  Future<Uint8List> captureWidget() async {
    imageIsLoading();

    final RenderRepaintBoundary boundary =
        globalKey.currentContext?.findRenderObject() as RenderRepaintBoundary;

    final ui.Image image = await boundary.toImage(pixelRatio: 3.0);

    final ByteData? byteData =
        await image.toByteData(format: ui.ImageByteFormat.png);

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
}
