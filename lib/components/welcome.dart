import 'package:flutter/material.dart';
import '/core/core.dart';

class Welcome extends StatelessWidget {
  final Function onPressed;

  const Welcome({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Container(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 130),
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/welcome.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: 70,
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 100),
              child: Text(
                textAlign: TextAlign.center,
                'Simple e objetivo. Edições rápidas e práticas',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: FilledButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
              Colors.white.withOpacity(0.10),
            ),
          ),
          onPressed: () {
            SharedPrefs().prefs.setBool('welcome', false);

            onPressed();
          },
          child: const Text(
            'Começar',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
