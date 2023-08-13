part of 'editor.dart';

extension EditorToggleButton on ImageEditorState {
  FloatingActionButton toggleButton() {
    return FloatingActionButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
      ),
      backgroundColor: const Color.fromARGB(255, 38, 38, 38),
      onPressed: () {
        toggleEdited();
      },
      child: Icon(
        showEdited == true ? Icons.visibility : Icons.visibility_off,
        color: showEdited == true ? Colors.yellow : Colors.grey,
      ),
    );
  }
}
