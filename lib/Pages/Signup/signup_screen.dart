import 'package:dhpversion2/Pages/Signup/components/signup_form.dart';
import 'package:dhpversion2/components/background.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Background(
      child: SignupForm(),
    );
  }
}
