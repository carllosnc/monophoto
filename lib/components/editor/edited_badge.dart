import 'package:flutter/material.dart';

class EditedBadge extends StatelessWidget {
  const EditedBadge({
    super.key,
    required this.showEdited,
  });

  final bool showEdited;

  @override
  Widget build(BuildContext context) {
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
}
