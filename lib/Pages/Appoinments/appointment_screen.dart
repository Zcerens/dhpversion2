import 'package:dhpversion2/Pages/Appoinments/components/appointment_form.dart';
import 'package:dhpversion2/components/background.dart';
import 'package:flutter/material.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({super.key});

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  @override
  Widget build(BuildContext context) {
    return Background(title: "Appointment", child: AppointmentForm());
  }
}
