import 'package:flutter/material.dart';
import 'package:library_management_app/modules/themes/app_color.dart';
import 'package:library_management_app/modules/themes/spacing.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  void _pushtoHomeScreen(BuildContext context) {
    Navigator.pushNamed(context, '/home');
  }

  void _pushtoSignUpScreen(BuildContext context) {
    Navigator.pushNamed(context, '/signUp');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Login',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 36,
              color: AppColors.mainColor,
            ),
          ),
          Spacing.v10,
          Spacing.v10,
          Spacing.v10,
          // Image.asset(
          //   'assets/images/login.png',
          // ),
          const Image(
            image: ResizeImage(
              AssetImage(
                'assets/images/login.png',
              ),
              height: 150,
              width: 200,
            ),
          ),
          Spacing.v10,
          Spacing.v10,
          Spacing.v10,
          Spacing.v10,
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.0),
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
          Container(
            margin: const EdgeInsets.fromLTRB(40, 80, 40, 100),
            height: 58,
            child: ElevatedButton(
              onPressed: () {
                _pushtoHomeScreen(context);
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.mainColor),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Login',
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
          // const Text.rich(
          //   TextSpan(
          //     text: 'Newbie around? ',
          //     children: <TextSpan>[
          //       TextSpan(
          //         text: 'Join us here.',
          //         style: TextStyle(fontWeight: FontWeight.bold),
          //       ),
          //     ],
          //   ),
          // ),
          GestureDetector(
            child: const Text('Sign Up'),
            onTap: () {
              _pushtoSignUpScreen(context);
            },
          ),
        ],
      ),
    );
  }
}
