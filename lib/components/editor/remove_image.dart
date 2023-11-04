import 'package:flutter/material.dart';

class RemoveImage extends StatelessWidget {
  final Function onClean;

  const RemoveImage({
    super.key,
    required this.onClean,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.close,
        color: Colors.red,
      ),
      onPressed: () {
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
                    onClean();
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
