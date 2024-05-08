import 'package:flutter/material.dart';

class EditorColorPicker extends StatefulWidget {
  final Color initialColor;
  final Function(Color color) onSelectedColor;

  const EditorColorPicker({
    super.key,
    this.initialColor = Colors.white,
    required this.onSelectedColor,
  });

  @override
  State<EditorColorPicker> createState() => _EditorColorPickerState();
}

class _EditorColorPickerState extends State<EditorColorPicker> {
  dynamic selected;
  late Color selectedColor;

  List<Color> colors = [
    Colors.black,
    ...List.generate(9, (index) => Colors.grey[(index + 1) * 100]!),
    ...List.generate(9, (index) => Colors.red[(index + 1) * 100]!),
    ...List.generate(9, (index) => Colors.green[(index + 1) * 100]!),
    ...List.generate(9, (index) => Colors.blue[(index + 1) * 100]!),
    ...List.generate(9, (index) => Colors.indigo[(index + 1) * 100]!),
    ...List.generate(9, (index) => Colors.yellow[(index + 1) * 100]!),
    ...List.generate(9, (index) => Colors.orange[(index + 1) * 100]!),
    ...List.generate(9, (index) => Colors.pink[(index + 1) * 100]!),
    ...List.generate(9, (index) => Colors.purple[(index + 1) * 100]!),
  ];

  @override
  void initState() {
    super.initState();

    selectedColor = widget.initialColor;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: const BoxDecoration(
            color: Colors.white,

            boxShadow: [
              BoxShadow(
                color: Colors.black,
                blurRadius: 10,
                offset: Offset(5, 0),
              ),
            ],

            //right radius
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                  color: selectedColor,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.black,
                    width: 2,
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: SizedBox(
            height: 35,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => const SizedBox(width: 5),
              itemCount: colors.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selected = index;
                      selectedColor = colors[index];
                    });

                    widget.onSelectedColor(colors[index]);
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.all(2),
                    width: selectedColor == colors[index] ? 60 : 30,
                    decoration: BoxDecoration(
                      color: colors[index],
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(
                        color: Colors.white,
                        width: 1,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
