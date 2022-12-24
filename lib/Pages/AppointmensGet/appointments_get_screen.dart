import 'package:dhpversion2/components/background.dart';
import 'package:flutter/material.dart';

import 'components/appointments_get_body.dart';

class AppointmentsGetScreen extends StatefulWidget {
  const AppointmentsGetScreen({super.key});

  @override
  State<AppointmentsGetScreen> createState() => _AppointmentsGetScreenState();
}

class _AppointmentsGetScreenState extends State<AppointmentsGetScreen> {
  @override
  Widget build(BuildContext context) {
    return Background(
      child: AppointmentsGetsBody(),
      title: 'My Appointments',
    );
  }
}
