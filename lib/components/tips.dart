import 'package:flutter/material.dart';

class Tips extends StatelessWidget {
  const Tips({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Check these tips before you start, known the icons from the editor.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white.withOpacity(0.6),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.dark_mode),
            title: Text(
              '[Darken]: use this to darken the image',
              style: TextStyle(
                color: Colors.white.withOpacity(0.6),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.light_mode),
            title: Text(
              '[Lighten]: use this to lighten the image',
              style: TextStyle(color: Colors.white.withOpacity(0.6)),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.contrast),
            title: Text(
              '[Shadow]: use this to intensify dark areas',
              style: TextStyle(color: Colors.white.withOpacity(0.6)),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.highlight),
            title: Text(
              '[Highlight]: use this to intensify light areas',
              style: TextStyle(color: Colors.white.withOpacity(0.6)),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.format_color_fill_rounded),
            title: Text(
              '[Color]: use this to colorize all the image',
              style: TextStyle(color: Colors.white.withOpacity(0.6)),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.palette),
            title: Text(
              '[Hue]: use this to intensify the colorful regions with a color',
              style: TextStyle(color: Colors.white.withOpacity(0.6)),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.blur_on),
            title: Text(
              '[Blur]: use this to ofuscate the image',
              style: TextStyle(color: Colors.white.withOpacity(0.6)),
            ),
          ),
          ListTile(
            leading: Icon(Icons.tune, color: Colors.blue.shade500),
            title: Text(
              '[Pressets]: use this to select a preset',
              style: TextStyle(color: Colors.white.withOpacity(0.6)),
            ),
          ),
          ListTile(
            leading: Icon(Icons.remove_red_eye, color: Colors.green.shade500),
            title: Text(
              '[Toggle]: use this to toggle between edited and original image',
              style: TextStyle(color: Colors.white.withOpacity(0.6)),
            ),
          ),
        ],
      ),
    );
  }
}
