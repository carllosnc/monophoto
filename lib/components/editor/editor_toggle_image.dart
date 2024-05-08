import 'package:flutter/material.dart';

class EditorToggleImage extends StatelessWidget {
  final Function onToggleEdited;
  final bool showEdited;

  const EditorToggleImage({
    super.key,
    required this.onToggleEdited,
    required this.showEdited,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.small(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
      ),
      backgroundColor: showEdited == true ? Colors.green.shade800 : Colors.red.shade800,
      onPressed: () {
        onToggleEdited();
      },
      child: Icon(
        showEdited == true ? Icons.visibility : Icons.visibility_off,
        color: showEdited == true ? Colors.white : Colors.white,
      ),
    );
  }
}
