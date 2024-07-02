import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:library_management_app/modules/route/route_name.dart';
import 'package:library_management_app/modules/screens/home_screen.dart';
import 'package:library_management_app/modules/themes/app_color.dart';
import 'package:library_management_app/modules/themes/spacing.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _login() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      _pushtoControl(context);
    } catch (e) {
      print(e);
    }
  }

  void _pushtoControl(BuildContext context) {
    Navigator.pushNamed(context, '/control');
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
          Spacing.v20,
          Spacing.v10,
          const Image(
            image: ResizeImage(
              AssetImage(
                'assets/images/login.png',
              ),
              height: 150,
              width: 200,
            ),
          ),
          Spacing.v40,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(24)),
                ),
                labelText: 'Email Address',
              ),
            ),
          ),
          Spacing.v20,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: TextField(
              obscureText: true,
              controller: _passwordController,
              decoration: const InputDecoration(
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
                // _pushtoHomeScreen(context);
                _login();
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
          TextButton(
            child: const Text.rich(
              TextSpan(
                text: 'Newbie around? ',
                children: <TextSpan>[
                  TextSpan(
                    text: 'Join us here.',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            onPressed: () {
              _pushtoSignUpScreen(context);
            },
          ),
        ],
      ),
    );
  }
}
