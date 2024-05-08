import 'package:flutter/material.dart';

class EditorResetEdition extends StatelessWidget {
  final Function onReset;

  const EditorResetEdition({
    super.key,
    required this.onReset,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.refresh,
        color: Colors.white,
      ),
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text(
                'Reset Edition',
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
                    onReset();
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
      },
    );
  }
}
