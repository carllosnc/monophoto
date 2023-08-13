part of 'editor.dart';

extension EditorEditionActions on ImageEditorState {
  void showSnackbar({required String message, bool isError = false}) {
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

  void editionDone(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SizedBox(
          height: 170,
          child: Column(
            children: [
              ListTile(
                onTap: () async {
                  await saveImage();
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
                onTap: () async {
                  await shareImage();
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
  }

  void resetEdition() {
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
                resetFilters();

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
}
