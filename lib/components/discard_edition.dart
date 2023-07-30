import 'package:flutter/material.dart';

discardEdition({
  required BuildContext context,
  required Function action,
}) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text(
          'Discard',
          style: TextStyle(fontFamily: 'SFProDisplay'),
        ),
        content: const Text(
          'Are you sure to discard the current edition?',
          style: TextStyle(fontFamily: 'SFProDisplay'),
        ),
        actions: [
          OutlinedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              'No',
              style: TextStyle(color: Colors.white),
            ),
          ),
          OutlinedButton(
            onPressed: () {
              action();

              Navigator.pop(context);
            },
            child: const Text(
              'Yes',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      );
    },
  );
}
