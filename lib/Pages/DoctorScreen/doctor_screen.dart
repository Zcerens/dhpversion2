import 'package:dhpversion2/Pages/DoctorScreen/components/doctor_form.dart';
import 'package:dhpversion2/components/background.dart';
import 'package:flutter/material.dart';

class DoctorScreen extends StatefulWidget {
  const DoctorScreen({super.key});

  @override
  State<DoctorScreen> createState() => _DoctorScreenState();
}

class _DoctorScreenState extends State<DoctorScreen> {
  @override
  Widget build(BuildContext context) {
    return Background(
      title: "Doctor Details",
      child: DoctorForm(),
    );
  }
}
