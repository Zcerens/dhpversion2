import 'package:dhpversion2/Pages/Appoinments/appointment_screen.dart';
import 'package:dhpversion2/Pages/AppointmentSchedule/appointments_schedule_screen.dart';
import 'package:dhpversion2/Pages/AppointmensPut/appointments_put_screen.dart';
import 'package:dhpversion2/Pages/Branches/branches_screen.dart';
import 'package:dhpversion2/Pages/Branches/components/branches_search.dart';
import 'package:dhpversion2/Pages/ChangePassword/change_password_screen.dart';
import 'package:dhpversion2/Pages/ChangePassword/components/change_password_form.dart';
import 'package:dhpversion2/Pages/DoctorScreen/doctor_screen.dart';
import 'package:dhpversion2/Pages/Login/login_screen.dart';
import 'package:dhpversion2/Pages/MainPage/main_screen.dart';
import 'package:dhpversion2/Pages/PageTransition/pageTransition_screen.dart';
import 'package:dhpversion2/Pages/Signup/signup_screen.dart';
import 'package:dhpversion2/demo.dart';
import 'package:flutter/material.dart';

import 'const/constant.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DHP Project',
      theme: ThemeData(
          primaryColor: kPrimaryColor,
          scaffoldBackgroundColor: Colors.white,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              primary: kPrimaryColor,
              shape: const StadiumBorder(),
              maximumSize: const Size(double.infinity, 56),
              minimumSize: const Size(double.infinity, 56),
            ),
          ),
          inputDecorationTheme: const InputDecorationTheme(
            filled: true,
            fillColor: kPrimaryLightColor,
            iconColor: kPrimaryColor,
            prefixIconColor: kPrimaryColor,
            contentPadding: EdgeInsets.symmetric(
                horizontal: defaultPadding, vertical: defaultPadding),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide.none,
            ),
          )),
      home: DoctorScreen(),
    );
  }
}
