import 'editor_state.dart';
import 'package:flutter/material.dart';

mixin EditorToggleButton on EditorState {
  FloatingActionButton toggleButton() {
    return FloatingActionButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
      ),
      backgroundColor: const Color.fromARGB(255, 38, 38, 38),
      onPressed: () {
        setState(() {
          showEdited = !showEdited;
        });
      },
      child: Icon(
        showEdited == true ? Icons.visibility : Icons.visibility_off,
        color: showEdited == true ? Colors.yellow : Colors.grey,
      ),
    );
  }
}
