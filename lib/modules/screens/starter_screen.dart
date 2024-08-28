import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../themes/spacing.dart';

class StarterScreen extends StatelessWidget {
  const StarterScreen({super.key});

  void _pushtoLoginScreen(BuildContext context) {
    Navigator.pushNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/images/bg.png',
              fit: BoxFit.cover,
            ),
          ),
          // Centered text
          Container(
            alignment: Alignment.topCenter,
            margin: const EdgeInsets.only(top: 150),
            child: Column(
              children: [
                const Text(
                  'Let\'s Explore',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 36.0,
                    fontWeight: FontWeight.w900,
                    shadows: [
                      Shadow(
                          offset: Offset(2.0, 2.0),
                          blurRadius: 3.0,
                          color: Colors.white54),
                    ],
                  ),
                ),
                const Text(
                  'Together!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 36.0,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                          offset: Offset(2.0, 2.0),
                          blurRadius: 3.0,
                          color: Colors.white54),
                    ],
                  ),
                ),
                Spacing.v10,
                SizedBox(
                  height: 50.0,
                  width: 250.0,
                  child: ElevatedButton(
                    onPressed: () {
                      _pushtoLoginScreen(context);
                    },
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.white),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.arrow_forward_rounded,
                          color: Colors.amber,
                        ),
                        Spacing.h4,
                        Text(
                          'Register',
                          style: TextStyle(
                              color: Colors.amber,
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        ),
                        Spacing.h4,
                        Icon(
                          Icons.arrow_back_rounded,
                          color: Colors.amber,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
