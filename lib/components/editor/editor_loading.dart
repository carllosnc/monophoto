import 'package:flutter/material.dart';

class EditorLoading extends StatelessWidget {
  const EditorLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Positioned(
      top: 15,
      right: 15,
      child: SizedBox(
        width: 25,
        height: 25,
        child: CircularProgressIndicator(
          backgroundColor: Colors.white,
          strokeWidth: 2,
          color: Colors.black,
        ),
      ),
    );
  }
}
