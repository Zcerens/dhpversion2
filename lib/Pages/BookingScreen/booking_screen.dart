import 'package:dhpversion2/Pages/BookingScreen/components/booking_form.dart';
import 'package:dhpversion2/components/background.dart';
import 'package:flutter/material.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  @override
  Widget build(BuildContext context) {
    return BookingForm();
  }
}
