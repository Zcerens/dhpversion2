import 'package:dhpversion2/Pages/HomeScreen/components/home_form.dart';
import 'package:dhpversion2/components/background.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Background(
      title: 'HOME SCREEN',
      child: HomeForm(),
    );
  }
}
