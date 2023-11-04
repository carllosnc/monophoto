import 'package:flutter/material.dart';

class ToggleEditedImage extends StatelessWidget {
  final Function onToggleEdited;
  final bool showEdited;

  const ToggleEditedImage({
    super.key,
    required this.onToggleEdited,
    required this.showEdited,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
      ),
      backgroundColor: const Color.fromARGB(255, 38, 38, 38),
      onPressed: () {
        onToggleEdited();
      },
      child: Icon(
        showEdited == true ? Icons.visibility : Icons.visibility_off,
        color: showEdited == true ? Colors.white : Colors.grey,
      ),
    );
  }
}
