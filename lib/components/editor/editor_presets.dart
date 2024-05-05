import 'package:flutter/material.dart';

class Preset {
  final String name;
  final Function function;

  const Preset(this.name, this.function);
}

class EdtiorPreset extends StatefulWidget {
  final List<Preset> presets;

  const EdtiorPreset({
    super.key,
    required this.presets,
  });

  @override
  State<EdtiorPreset> createState() => _EdtiorPresetState();
}

class _EdtiorPresetState extends State<EdtiorPreset> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.small(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
      ),
      backgroundColor: Colors.blue.shade700,
      child: const Icon(
        Icons.layers,
      ),
      onPressed: () {
        showModalBottomSheet(
          context: context,
          barrierColor: Colors.transparent,
          builder: (context) {
            return SizedBox(
              height: 230,
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    height: 30,
                    color: Colors.black,
                    child: const Text(
                      "PRESETS",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 200,
                    child: ListView.separated(
                      separatorBuilder: (context, index) => const Divider(
                        height: 1,
                        color: Color.fromARGB(255, 46, 46, 46),
                      ),
                      itemCount: widget.presets.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: const Icon(
                            Icons.tune,
                            color: Colors.white,
                          ),
                          title: Text(widget.presets[index].name),
                          onTap: () {
                            widget.presets[index].function();
                          },
                        );
                      },
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
