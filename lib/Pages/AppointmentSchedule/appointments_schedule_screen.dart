import 'package:dhpversion2/Pages/AppointmentSchedule/components/appointments_schedule_form.dart';
import 'package:dhpversion2/components/background.dart';
import 'package:flutter/material.dart';

class AppointmentsScheduleScreen extends StatefulWidget {
  const AppointmentsScheduleScreen({super.key});

  @override
  State<AppointmentsScheduleScreen> createState() =>
      _AppointmentsScheduleScreenState();
}

class _AppointmentsScheduleScreenState
    extends State<AppointmentsScheduleScreen> {
  @override
  Widget build(BuildContext context) {
    return Background(
      child: AppointmentsScheduleForm(),
      title: 'My Appointments',
    );
  }
}
