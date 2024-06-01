import 'package:flutter/material.dart';
import 'package:library_management_app/modules/themes/app_color.dart';
import 'package:library_management_app/modules/themes/spacing.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  void _poptoLoginScreen(BuildContext context) {
    Navigator.pop(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(0, 40, 0, 60),
            child: const Text(
              'Sign Up',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 36,
                color: AppColors.mainColor,
              ),
            ),
          ),
          Spacing.v10,
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(24)),
                ),
                labelText: 'Email Address',
              ),
            ),
          ),
          Spacing.v10,
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.0),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(24)),
                ),
                labelText: 'Username',
              ),
            ),
          ),
          Spacing.v10,
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.0),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(24)),
                ),
                labelText: 'Password',
              ),
            ),
          ),
          Spacing.v10,
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.0),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(24)),
                ),
                labelText: 'Confirm Password',
              ),
            ),
          ),
          Spacing.v10,
          Container(
            margin: const EdgeInsets.fromLTRB(40, 60, 40, 60),
            height: 58,
            child: ElevatedButton(
              onPressed: () {
                _poptoLoginScreen(context);
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.mainColor),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Sign up',
                    //note: Pop a notification of successful sign up!
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  Spacing.h4,
                  Icon(
                    Icons.arrow_forward_rounded,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              _poptoLoginScreen(context);
            },
            child: const Text.rich(
              TextSpan(
                text: 'Already signed up? ',
                children: <TextSpan>[
                  TextSpan(
                    text: 'Login here.',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
