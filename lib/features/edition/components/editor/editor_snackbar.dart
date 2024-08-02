import 'package:flutter/material.dart';

void editorSnackbar({
  required String message,
  bool isError = false,
  required BuildContext context,
}) {
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
