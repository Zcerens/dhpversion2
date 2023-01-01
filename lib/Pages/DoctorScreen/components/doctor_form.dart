import 'package:dhpversion2/Pages/AppointmentSchedule/appointments_schedule_screen.dart';
import 'package:dhpversion2/Pages/AppointmensPut/appointments_put_screen.dart';
import 'package:dhpversion2/Pages/BookingScreen/booking_screen.dart';
import 'package:dhpversion2/Pages/Branches/branches_screen.dart';
import 'package:dhpversion2/const/constant.dart';
import 'package:flutter/material.dart';

class DoctorForm extends StatefulWidget {
  const DoctorForm({super.key});

  @override
  State<DoctorForm> createState() => _DoctorFormState();
}

class _DoctorFormState extends State<DoctorForm> {
  bool isFav = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: <Widget>[
          AboutDoctor(), DetailBody(),
          //About doctor
          Padding(
            padding: const EdgeInsets.all(50),
            child: ElevatedButton(
              child: Text("Book Appointment"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const BookingScreen()),
                );
              },
            ),
          )
        ],
      )),
    );
  }
}

class AboutDoctor extends StatelessWidget {
  const AboutDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: double.infinity * 0.85,
      child: Column(children: <Widget>[
        SizedBox(
          height: 20,
        ),
        CircleAvatar(
          radius: 70,
          backgroundImage: AssetImage('assets/images/doctor2.jpg'),
          backgroundColor: Colors.white,
        ),
        SizedBox(
          height: 25,
        ),
        Text(
          "Dr Richard Tan",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          softWrap: true,
        ),
        SizedBox(
          height: 25,
        ),
        SizedBox(
          width: width * 0.75,
          child: const Text(
            "MBBS (Imternational Medical University, Ankara), MRCP (Royal Collefe of Physicians, United Kingdom)",
            style: TextStyle(fontSize: 15, color: Colors.grey),
            softWrap: true,
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: 25,
        ),
        SizedBox(
          width: width * 0.75,
          child: const Text(
            "Hacettepe Hospital",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            softWrap: true,
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: 40,
        )
      ]),
    );
  }
}

class DetailBody extends StatelessWidget {
  const DetailBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(bottom: 30),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[DoctorInfo()]),
    );
  }
}

class DoctorInfo extends StatelessWidget {
  const DoctorInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const <Widget>[
        InfoCard(label: "PAtients", value: "109"),
        SizedBox(
          width: 15,
        ),
        InfoCard(label: "Experinces", value: "10 years"),
        SizedBox(
          width: 15,
        ),
        InfoCard(label: "Rating", value: "4.6")
      ],
    );
  }
}

class InfoCard extends StatelessWidget {
  const InfoCard({super.key, required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: kPrimaryLightColor),
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 15),
        child: Column(children: <Widget>[
          Text(
            label,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            value,
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(
            height: 10,
          ),
        ]),
      ),
    );
  }
}
