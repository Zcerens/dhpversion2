import 'package:dhpversion2/components/background.dart';
import 'package:flutter/material.dart';

import 'components/appointments_put_body.dart';

class AppointmentsPutScreen extends StatefulWidget {
  const AppointmentsPutScreen({super.key});

  @override
  State<AppointmentsPutScreen> createState() => _AppointmentsPutScreenState();
}

class _AppointmentsPutScreenState extends State<AppointmentsPutScreen> {
  @override
  Widget build(BuildContext context) {
    return Background(
      child: AppointmentsPutsBody(),
      title: 'My Appointments',
    );
  }
}
