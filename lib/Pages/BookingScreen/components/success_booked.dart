import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AppointmentBooked extends StatelessWidget {
  const AppointmentBooked({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: <Widget>[
          Expanded(child: Lottie.asset('assets/lotties/success.json')),
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            child: Text(
              "Succesfully booked",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          )
          //succesfully bppled eklenecek
        ],
      )),
    );
  }
}
