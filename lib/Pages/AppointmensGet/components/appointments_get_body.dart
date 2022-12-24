import 'dart:core';
import 'package:country_state_city_picker/country_state_city_picker.dart';
import 'package:dhpversion2/const/constant.dart';
import 'package:flutter/material.dart';

import 'package:date_field/date_field.dart';
import 'package:date_time_picker/date_time_picker.dart';

import '../../AppointmensPut/components/model_appintments.dart';

class AppointmentsGetsBody extends StatefulWidget {
  const AppointmentsGetsBody({Key? key}) : super(key: key);

  @override
  _AppointmentsGetsBodyState createState() => _AppointmentsGetsBodyState();
}

class _AppointmentsGetsBodyState extends State<AppointmentsGetsBody> {
  @override
  late List<Appointment> appointments;
  late List<Appointment> selectedAppointments;
  late bool sort;
  bool flag = true;

  final formKey = GlobalKey<FormState>();

  List<String> branches__ = ['Cocuk', 'Kulak', 'Estetik'];
  String? selectedBranch__ = 'Cocuk';
  late String doctor_name;
  String date_start = "";
  String date_end = "";
  String dateEmpty = "";
  String countryValue = "";
  String stateValue = "";
  String cityValue = "";
  int dateDifference() {
    return DateTime.parse(date_end)
        .difference(DateTime.parse(date_start))
        .inDays;
  }

  void initState() {
    selectedAppointments = [];
    appointments = Appointment.getAppointments();
    super.initState();
  }

  onSelectedRow(bool selected, Appointment appo) async {
    setState(() {
      if (selected) {
        selectedAppointments.add(appo);
      } else {
        selectedAppointments.remove(appo);
      }
    });
  }

  deleteSelected() async {
    setState(() {
      if (selectedAppointments.isNotEmpty) {
        List<Appointment> temp = [];
        temp.addAll(selectedAppointments);
        for (Appointment appo in temp) {
          appointments.remove(appo);
          selectedAppointments.remove(appo);
        }
      }
    });
  }

  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      child: Column(
        children: [
          Container(
            child: Column(
              children: [
                Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 30),
                        buildBrach(),
                        SizedBox(height: 30),
                        buildDoctorName(),
                        SizedBox(height: 30),
                        build_date_start(),
                        SizedBox(height: 30),
                        build_date_end(),
                        SizedBox(height: 30),
                        buildCountry(),
                        SizedBox(height: 30),
                        buildSubmit(),
                        SizedBox(height: 30),
                      ],
                    )),
                Container(
                  child: ElevatedButton(
                    child: Text('Add'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kPrimaryLightColor,
                    ),
                    onPressed: () {
                      //appointments.add();
                    },
                  ),
                ),
                Row(children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: OutlinedButton(
                      onPressed: () {},
                      child: Text('SELECTED ${selectedAppointments.length}'),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: OutlinedButton(
                      onPressed: () {
                        deleteSelected();
                      },
                      child: Text('DELETE SELECTED '),
                    ),
                  )
                ])
              ],
            ),
          ),
          //buildTableData(),
        ],
      ),
    );
  }

  Widget buildDoctorName() => TextFormField(
        decoration: InputDecoration(
          labelText: 'Doctor Name',
          icon: Icon(Icons.person),
          fillColor: Colors.white,
          border: OutlineInputBorder(),
          // errorBorder:
          //     OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
          // focusedErrorBorder:
          //     OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
          // errorStyle: TextStyle(color: Colors.purple),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },
        maxLength: 30,
        onSaved: (value) => setState(() => doctor_name = value!),
      );
  Widget build_date_start() => DateTimePicker(
        decoration: const InputDecoration(
          icon: Icon(Icons.event_note),
          fillColor: Colors.white,
          border: OutlineInputBorder(),
        ),
        dateMask: 'd MMM, yyyy',
        initialValue: DateTime.now().toString(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
        icon: Icon(Icons.event),
        dateLabelText: 'Date',
        selectableDayPredicate: (date) {
          // Disable weekend days to select from the calendar
          /*if (date.weekday == 6 || date.weekday == 7) {
            return false;
          }
    */
          return true;
        },
        onChanged: (val) {
          setState(() => date_start = val);

          print(date_start);
          print(date_start.runtimeType);
        },
        validator: (val) {},
        onSaved: (val) => print(val),
      );
  Widget build_date_end() => DateTimePicker(
      decoration: const InputDecoration(
        icon: Icon(Icons.event_note),
        fillColor: Colors.white,
        border: OutlineInputBorder(),
      ),
      dateMask: 'd MMM, yyyy',
      initialValue: DateTime.now().toString(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      dateLabelText: 'Date',
      errorInvalidText: "s",
      selectableDayPredicate: (date) {
        // Disable weekend days to select from the calendar
        /*if (date.weekday == 6 || date.weekday == 7) {
            return false;
          }*/

        return true;
      },
      onChanged: (val) {
        setState(() => date_end = val);
        if (dateDifference() < 0) {
          print("hata");
          flag = false;
        }
        val = "";

        print(date_end);
        print(date_end.runtimeType);
      },
      validator: (val) {
        if (flag == false) {
          print("end Startan once olamaz");
        }
        return null;
      },
      onSaved: (val) {
        print(val);
      });
  Widget buildCountry() => SelectState(
        onCountryChanged: (value) {
          setState(() {
            countryValue = value;
          });
        },
        onStateChanged: (value) {
          setState(() {
            stateValue = value;
          });
        },
        onCityChanged: (value) {
          setState(() {
            cityValue = value;
          });
        },
      );
  Widget buildSubmit() => Builder(
        builder: (context) => ElevatedButton(
          onPressed: () {
            final isValid = formKey.currentState!.validate();
            // FocusScope.of(context).unfocus();

            if (isValid) {
              formKey.currentState!.save();

              final message = 'xx';
              final snackBar = SnackBar(
                content: Text(
                  message,
                  style: TextStyle(fontSize: 20),
                ),
                // width: 50,
                backgroundColor: Colors.green,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
          child: Text("SAVE"),
        ),
      );
  Widget buildBrach() => DropdownButtonFormField<String>(
        validator: (value) {
          if (value == null) {
            return 'Select a Branch';
          } else {
            return null;
          }
        },
        decoration: InputDecoration(
          labelText: "Branch",
          icon: Icon(Icons.person_pin_circle),

          enabledBorder: OutlineInputBorder(
              //borderSide: BorderSide(color: Colors.blue, width: 2),

              ),
          border: OutlineInputBorder(
            borderSide:
                BorderSide(color: Color.fromARGB(255, 35, 35, 35), width: 0.4),
          ),
          //filled: true,
          fillColor: Colors.white,
        ),
        value: null,
        items: branches__
            .map((branchType) => DropdownMenuItem<String>(
                value: branchType,
                child: Text(branchType, style: TextStyle(fontSize: 16))))
            .toList(),
        onChanged: (branchType) =>
            setState(() => selectedBranch__ = branchType),
      );
}
