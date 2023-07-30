import 'package:flutter/material.dart';
import './editor_state.dart';
import '/components/components.dart';

mixin EditorBottom on EditorState {
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
            onSetIntensity: (double value) {
              setState(() {
                colorFilterIntensity = value;
              });
            },
            onSetColor: (Color value) {
              setState(() {
                colorFilterColor = value;
              });
            },
          ),

          // soft ligth filter
          FilterButton(
            initialColor: softLightFilterColor,
            initialIntensity: softLightFilterIntensity,
            icon: Icons.lightbulb,
            title: 'Soft Light',
            onSetIntensity: (double value) {
              setState(() {
                softLightFilterIntensity = value;
              });
            },
            onSetColor: (Color value) {
              setState(() {
                softLightFilterColor = value;
              });
            },
          ),

          // saturation filter
          FilterButton(
            initialColor: saturationFilterColor,
            initialIntensity: saturationFilterIntensity,
            icon: Icons.contrast,
            title: 'Saturation',
            onSetIntensity: (double value) {
              setState(() {
                saturationFilterIntensity = value;
              });
            },
            onSetColor: (Color value) {
              setState(() {
                saturationFilterColor = value;
              });
            },
          ),

          FilterButton(
            initialColor: hueFilterColor,
            initialIntensity: hueFilterIntensity,
            icon: Icons.colorize,
            title: 'Hue',
            onSetIntensity: (double value) {
              setState(() {
                hueFilterIntensity = value;
              });
            },
            onSetColor: (Color value) {
              setState(() {
                hueFilterColor = value;
              });
            },
          ),

          FilterButton(
            initialColor: overlayFilterColor,
            initialIntensity: overlayFilterIntensity,
            icon: Icons.layers,
            title: 'Overlay',
            onSetIntensity: (double value) {
              setState(() {
                overlayFilterIntensity = value;
              });
            },
            onSetColor: (Color value) {
              setState(() {
                overlayFilterColor = value;
              });
            },
          ),

          FilterButton(
            initialColor: multiplyFilterColor,
            initialIntensity: multiplyFilterIntensity,
            icon: Icons.auto_awesome_motion_sharp,
            title: 'Multiply',
            onSetIntensity: (double value) {
              setState(() {
                multiplyFilterIntensity = value;
              });
            },
            onSetColor: (Color value) {
              setState(() {
                multiplyFilterColor = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
