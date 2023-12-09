import 'package:flutter/material.dart';

appTheme() => ThemeData(
      scaffoldBackgroundColor: Colors.black,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      dividerColor: Colors.white.withOpacity(0.2),
      useMaterial3: true,
      brightness: Brightness.dark,
      colorSchemeSeed: Colors.red,
      fontFamily: 'SFProDisplay',
      iconTheme: const IconThemeData(color: Colors.white),
      sliderTheme: SliderThemeData(
        activeTrackColor: Colors.white.withOpacity(0.5),
        inactiveTrackColor: Colors.white.withOpacity(0.2),
        thumbColor: Colors.white,
        overlayColor: Colors.white.withOpacity(0.2),
        trackHeight: 2,
        thumbShape: const RoundSliderThumbShape(
          enabledThumbRadius: 8,
        ),
        overlayShape: const RoundSliderOverlayShape(
          overlayRadius: 16,
        ),
      ),
      dialogTheme: DialogTheme(
        contentTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
        backgroundColor: const Color.fromARGB(255, 85, 0, 0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Color.fromARGB(255, 23, 23, 23),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(0),
          ),
        ),
      ),
    );
