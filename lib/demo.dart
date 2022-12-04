import 'package:flutter/material.dart';
import 'package:csc_picker/csc_picker.dart';

class Demo extends StatefulWidget {
  const Demo({super.key});

  @override
  State<Demo> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CSCPicker(
        onCountryChanged: (country) {},
        onStateChanged: (state) {},
        onCityChanged: (city) {},
      ),
    );
  }
}
