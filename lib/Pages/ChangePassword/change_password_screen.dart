import 'package:flutter/material.dart';

import '../../components/background.dart';
import 'components/change_password_form.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Background(
      title: 'Change Password',
      child: ChangePasswordForm(),
    );
  }
}
