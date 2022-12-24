import 'package:dhpversion2/Pages/MainPage/components/main_form.dart';
import 'package:dhpversion2/components/background.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Background(title: "Digital Health Platform", child: MainForm());
  }
}
