import 'package:flutter/material.dart';

class Tips extends StatelessWidget {
  const Tips({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      color: Colors.white,
      onPressed: () {
        showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: const Color(0xFF181818),
          context: context,
          builder: (context) {
            return SizedBox(
              height: MediaQuery.of(context).size.height - 70,
              child: Scaffold(
                backgroundColor: const Color(0xFF181818),
                appBar: AppBar(
                  backgroundColor: const Color(0xFF181818),
                  title: const Text(
                    'Tips',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.close),
                  ),
                ),
                body: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          'Check these tips before start.',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white.withValues(alpha: 0.5),
                          ),
                        ),
                      ),
                      ListTile(
                        leading: const Icon(Icons.dark_mode),
                        title: Text(
                          '[Darken]: use this to darken the image',
                          style: TextStyle(
                            color: Colors.white.withValues(alpha: 0.5),
                          ),
                        ),
                      ),
                      ListTile(
                        leading: const Icon(Icons.light_mode),
                        title: Text(
                          '[Lighten]: use this to lighten the image',
                          style: TextStyle(color: Colors.white.withValues(alpha: 0.5)),
                        ),
                      ),
                      ListTile(
                        leading: const Icon(Icons.contrast),
                        title: Text(
                          '[Shadow]: use this to intensify dark areas',
                          style: TextStyle(color: Colors.white.withValues(alpha: 0.5)),
                        ),
                      ),
                      ListTile(
                        leading: const Icon(Icons.highlight),
                        title: Text(
                          '[Highlight]: use this to intensify light areas',
                          style: TextStyle(color: Colors.white.withValues(alpha: 0.5)),
                        ),
                      ),
                      ListTile(
                        leading: const Icon(Icons.format_color_fill_rounded),
                        title: Text(
                          '[Color]: use this to colorize all the image',
                          style: TextStyle(color: Colors.white.withValues(alpha: 0.5)),
                        ),
                      ),
                      ListTile(
                        leading: const Icon(Icons.palette),
                        title: Text(
                          '[Hue]: use this to intensify the colorful regions with a color',
                          style: TextStyle(color: Colors.white.withValues(alpha: 0.5)),
                        ),
                      ),
                      ListTile(
                        leading: const Icon(Icons.blur_on),
                        title: Text(
                          '[Blur]: use this to obfuscate the image',
                          style: TextStyle(color: Colors.white.withValues(alpha: 0.5)),
                        ),
                      ),
                      ListTile(
                        leading: Icon(Icons.tune, color: Colors.blue.shade500),
                        title: Text(
                          '[Presets]: use this to select a preset',
                          style: TextStyle(color: Colors.white.withValues(alpha: 0.5)),
                        ),
                      ),
                      ListTile(
                        leading: Icon(Icons.remove_red_eye, color: Colors.green.shade500),
                        title: Text(
                          '[Toggle]: use this to toggle between edited and original image',
                          style: TextStyle(color: Colors.white.withValues(alpha: 0.5)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
      icon: const Icon(Icons.info_outline),
    );
  }
}
