import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EditorBackButton extends StatelessWidget {
  const EditorBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.close),
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Are you sure?'),
              content: const Text('You edition will be lost!'),
              actions: [
                OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('No'),
                ),
                OutlinedButton(
                  onPressed: () {
                    context.go('/');
                  },
                  child: const Text('Yes'),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
