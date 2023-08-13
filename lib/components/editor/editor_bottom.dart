part of 'editor.dart';

extension EditorBottom on ImageEditorState {
  Container bottomNavigation() {
    return Container(
      color: Colors.white.withOpacity(0.12),
      height: 70,
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          //color filter
          FilterButton(
            initialColor: colorFilterColor,
            initialIntensity: colorFilterIntensity,
            icon: Icons.format_color_fill,
            title: 'Color',
            onSetIntensity: setColorFilterIntensity,
            onSetColor: setColorFilterColor,
          ),

          // soft ligth filter
          FilterButton(
            initialColor: softLightFilterColor,
            initialIntensity: softLightFilterIntensity,
            icon: Icons.lightbulb,
            title: 'Soft Light',
            onSetIntensity: setSoftLightFilterIntensity,
            onSetColor: setSoftLightFilterColor,
          ),

          // saturation filter
          FilterButton(
            initialColor: saturationFilterColor,
            initialIntensity: saturationFilterIntensity,
            icon: Icons.contrast,
            title: 'Saturation',
            onSetIntensity: setSaturationFilterIntensity,
            onSetColor: setSaturationFilterColor,
          ),

          FilterButton(
            initialColor: hueFilterColor,
            initialIntensity: hueFilterIntensity,
            icon: Icons.colorize,
            title: 'Hue',
            onSetIntensity: setHueFilterIntensity,
            onSetColor: setHueFilterColor,
          ),

          FilterButton(
            initialColor: overlayFilterColor,
            initialIntensity: overlayFilterIntensity,
            icon: Icons.layers,
            title: 'Overlay',
            onSetIntensity: setOverlayFilterIntensity,
            onSetColor: setOverlayFilterColor,
          ),

          FilterButton(
            initialColor: multiplyFilterColor,
            initialIntensity: multiplyFilterIntensity,
            icon: Icons.auto_awesome_motion_sharp,
            title: 'Multiply',
            onSetIntensity: setMultiplyFilterIntensity,
            onSetColor: setMultiplyFilterColor,
          ),
        ],
      ),
    );
  }
}
