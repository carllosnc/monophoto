import 'package:flutter/material.dart';

class EditionDone extends StatelessWidget {
  final Function onSave;
  final Function onShare;

  const EditionDone({
    super.key,
    required this.onSave,
    required this.onShare,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.done,
        color: Colors.green.shade400,
      ),
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return SizedBox(
              height: 170,
              child: Column(
                children: [
                  ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 30),
                    onTap: () async {
                      await onSave();
                    },
                    trailing: const Icon(
                      Icons.save,
                      color: Colors.white,
                    ),
                    title: const Text(
                      'Save',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Divider(color: Colors.white.withOpacity(0.1), height: 1),
                  ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 30),
                    onTap: () async {
                      await onShare();
                    },
                    trailing: const Icon(
                      Icons.share,
                      color: Colors.white,
                    ),
                    title: const Text(
                      'Share',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
