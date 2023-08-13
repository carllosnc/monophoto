part of 'editor.dart';

extension EditorHeader on ImageEditorState {
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
          onPressed: resetEdition,
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
