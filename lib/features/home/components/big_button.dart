import 'package:flutter/material.dart';

class BigButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final BorderRadius borderRadius;
  final void Function()? onTap;

  const BigButton({
    super.key,
    required this.borderRadius,
    required this.icon,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
      ),
      width: 230,
      child: Material(
        color: const Color.fromARGB(255, 31, 31, 31),
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 40,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: const Color.fromARGB(255, 131, 131, 131),
                  size: 40,
                ),
                const SizedBox(height: 10),
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
