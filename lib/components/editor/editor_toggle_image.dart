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
    return IconButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          showEdited == true ? Colors.green.shade700 : Colors.red.shade700,
        ),
      ),
      onPressed: () {
        onToggleEdited();
      },
      icon: Icon(
        showEdited == true ? Icons.visibility : Icons.visibility_off,
        color: showEdited == true ? Colors.white : Colors.white,
      ),
    );
  }
}
