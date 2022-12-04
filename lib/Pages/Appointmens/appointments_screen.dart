import 'package:dhpversion2/components/background.dart';
import 'package:flutter/material.dart';

import 'components/appointments_body.dart';

class AppointmentsScreen extends StatefulWidget {
  const AppointmentsScreen({super.key});

  @override
  State<AppointmentsScreen> createState() => _AppointmentsScreenState();
}

class _AppointmentsScreenState extends State<AppointmentsScreen> {
  @override
  Widget build(BuildContext context) {
    return Background(
      title: "Appointment".toUpperCase(),
      child: AppointmentsBody(),
      //title: 'My Appointments',
    );
  }
}
