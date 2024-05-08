import 'package:flutter/material.dart';
import '/components/components.dart';

class EditorFilter extends StatefulWidget {
  final IconData icon;
  final String title;
  final bool canEditColor;
  final Function(double value) onSetIntensity;
  final Function(Color value) onSetColor;
  final double maxIntensity;

  final double initialIntensity;
  final Color initialColor;

  const EditorFilter({
    super.key,
    required this.icon,
    required this.title,
    required this.onSetIntensity,
    required this.onSetColor,
    required this.initialIntensity,
    required this.initialColor,
    required this.canEditColor,
    this.maxIntensity = 1,
  });

  @override
  State<EditorFilter> createState() => _EditorFilterState();
}

class _EditorFilterState extends State<EditorFilter> {
  late double currentIntensity;
  late Color currentColor;

  @override
  void initState() {
    super.initState();
    currentIntensity = widget.initialIntensity * 100;
    currentColor = widget.initialColor;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white.withOpacity(0.0),
      child: IconButton(
        icon: Badge(
          offset: const Offset(-12, -20),
          isLabelVisible: widget.initialIntensity != 0,
          backgroundColor: widget.initialColor,
          textColor: widget.initialColor.computeLuminance() > 0.5 ? Colors.black : Colors.white,
          label: Text(widget.initialIntensity.toStringAsFixed(2)),
          child: Icon(widget.icon, color: Colors.white),
        ),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            barrierColor: Colors.transparent,
            builder: (context) {
              return StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
                  return Container(
                    height: 180,
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      vertical: 15,
                    ),
                    child: Column(
                      children: [
                        Text(
                          widget.title.toUpperCase(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: Row(
                            children: [
                              Container(
                                width: 60,
                                height: 20,
                                alignment: Alignment.centerRight,
                                child: Text(
                                  "Intensity",
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.5),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Slider(
                                  value: currentIntensity,
                                  onChanged: (newValue) {
                                    setState(() {
                                      currentIntensity = newValue;
                                    });

                                    widget.onSetIntensity(
                                      currentIntensity.roundToDouble() / 100,
                                    );
                                  },
                                  min: 0,
                                  max: 100 * widget.maxIntensity,
                                  divisions: 100,
                                  activeColor: Colors.white,
                                  inactiveColor: Colors.white.withOpacity(0.2),
                                  label: (currentIntensity.round() / 100).toString(),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 25),
                        if (widget.canEditColor)
                          EditorColorPicker(
                            initialColor: currentColor,
                            onSelectedColor: (color) {
                              setState(() {
                                currentColor = color;
                              });

                              widget.onSetColor(currentColor);
                            },
                          ),
                      ],
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
