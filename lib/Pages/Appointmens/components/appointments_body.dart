import 'package:dhpversion2/const/constant.dart';
import 'package:flutter/material.dart';

import 'package:date_field/date_field.dart';
import 'package:date_time_picker/date_time_picker.dart';

import 'model_appintments.dart';

class AppointmentsBody extends StatefulWidget {
  const AppointmentsBody({Key? key}) : super(key: key);

  @override
  _AppointmentsBodyState createState() => _AppointmentsBodyState();
}

class _AppointmentsBodyState extends State<AppointmentsBody> {
  @override
  late List<Appointment> appointments;
  late List<Appointment> selectedAppointments;
  late bool sort;

  final formKey = GlobalKey<FormState>();
  int? max_number_of_admissions;
  late String day;
  late String time_start;
  late String time_end;

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
                        build_number_of_admissions(),
                        SizedBox(height: 15),
                        build_date(),
                        SizedBox(height: 15),
                        build_date_start(),
                        SizedBox(height: 15),
                        build_date_end(),
                        SizedBox(
                          height: 15,
                        )
                      ],
                    )),
                Container(
                  child: ElevatedButton(
                    child: Text('Add'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kPrimaryLightColor,
                    ),
                    onPressed: () {
                      appointments.add(Appointment(
                          max_number_of_admissions: max_number_of_admissions,
                          day: day,
                          time_end: time_end,
                          time_start: time_start));
                    },
                  ),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(20.0),
                        child: OutlinedButton(
                          onPressed: () {},
                          child:
                              Text('SELECTED ${selectedAppointments.length}'),
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
          buildTableData(),
        ],
      ),
    );
  }

  Widget build_number_of_admissions() => TextFormField(
      decoration: const InputDecoration(
        labelText: 'Number of Admissions',
        icon: Icon(Icons.person),
        fillColor: Colors.white,
        border: OutlineInputBorder(),

        // errorBorder:
        //     OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
        // focusedErrorBorder:
        //     OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
        // errorStyle: TextStyle(color: Colors.purple),
      ),
      keyboardType: TextInputType.number,
      validator: (value) {
        final isDigitsOnly = int.tryParse(value!);
        return isDigitsOnly == null ? 'Input needs to be digits only' : null;
      },
      onSaved: (value) {
        print(value.runtimeType);
        setState(() => max_number_of_admissions = value as int?);
        print(max_number_of_admissions);
        print(max_number_of_admissions.runtimeType);
      });
  Widget build_date() => DateTimePicker(
        decoration: const InputDecoration(
          //iconu başa aldım
          icon: Icon(Icons.event_note),
          //suffixIcon: Icon(Icons.event_note),
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
          if (date.weekday == 6 || date.weekday == 7) {
            return false;
          }

          return true;
        },
        onChanged: (val) {
          setState(() => day = val);

          print(day);
          print(day.runtimeType);
        },
        validator: (val) {
          return null;
        },
        onSaved: (val) => print(val),
      );

  Widget build_date_start() => DateTimeFormField(
        decoration: const InputDecoration(
          fillColor: Colors.white,
          hintStyle: TextStyle(color: Colors.black45),
          errorStyle: TextStyle(color: Colors.redAccent),
          border: OutlineInputBorder(),
          icon: Icon(Icons.lock_clock),
          //suffixIcon: Icon(Icons.lock_clock),
          labelText: 'Start Time',
        ),
        mode: DateTimeFieldPickerMode.time,
        autovalidateMode: AutovalidateMode.always,
        validator: (e) {
          // (e?.day ?? 0) == 1 ? 'Please not the first day' :
          return null;
        },
        onDateSelected: (DateTime value) {
          setState(() => time_start = value.toString());
          print(time_start.runtimeType);
        },
      );
  Widget build_date_end() => DateTimeFormField(
        decoration: const InputDecoration(
          fillColor: Colors.white,
          hintStyle: TextStyle(color: Colors.black45),
          errorStyle: TextStyle(color: Colors.redAccent),
          border: OutlineInputBorder(),
          icon: Icon(Icons.lock_clock),
          labelText: 'End Time',
        ),
        mode: DateTimeFieldPickerMode.time,
        autovalidateMode: AutovalidateMode.always,
        validator: (e) {
          // (e?.day ?? 0) == 1 ? 'Please not the first day' :
          return null;
        },
        //

        onDateSelected: (DateTime value) {
          setState(() => time_end = value.toString());
          print(time_end.runtimeType);
        },
      );
  Widget buildTableData() => SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: [
            DataColumn(
              label: Text("Number of admission "),
              numeric: false,
              tooltip: "This is Number of admission",
            ),
            DataColumn(
                label: Text("Day"), numeric: false, tooltip: "This is Day"),
            DataColumn(
                label: Text("Start Time"),
                numeric: false,
                tooltip: "This is StartTime"),
            DataColumn(
                label: Text("End Time"),
                numeric: false,
                tooltip: "This is EndTime")
          ],
          rows: appointments
              .map(
                (appointment) => DataRow(
                  selected: selectedAppointments.contains(appointment),
                  onSelectChanged: (b) {
                    print("On select");
                    onSelectedRow(b!, appointment);
                  },
                  cells: [
                    DataCell(
                      Text('${appointment.max_number_of_admissions}'),
                    ),
                    DataCell(
                      Text(appointment.day),
                    ),
                    DataCell(
                      Text(appointment.time_start),
                    ),
                    DataCell(
                      Text(appointment.time_end),
                    )
                  ],
                ),
              )
              .toList(),
        ),
      );
}
