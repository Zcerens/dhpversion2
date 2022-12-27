import 'package:dhpversion2/Pages/AppointmentSchedule/appointments_schedule_screen.dart';
import 'package:dhpversion2/Pages/AppointmensPut/appointments_put_screen.dart';
import 'package:dhpversion2/Pages/Branches/branches_screen.dart';
import 'package:flutter/material.dart';

class PageTransition extends StatefulWidget {
  const PageTransition({super.key});

  @override
  State<PageTransition> createState() => _PageTransitionState();
}

class _PageTransitionState extends State<PageTransition> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const AppointmentsPutScreen()),
              );
            },
            child: Text(
              "Randevu Ver",
            )),
        SizedBox(
          height: 20,
        ),
        ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const AppointmentsScheduleScreen()),
              );
            },
            child: Text(
              "Randevu Al",
            ))
      ]),
    ));
  }
}
