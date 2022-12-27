import 'package:dhpversion2/const/constant.dart';
import 'package:flutter/material.dart';

class AppointmentsScheduleForm extends StatefulWidget {
  const AppointmentsScheduleForm({super.key});

  @override
  State<AppointmentsScheduleForm> createState() =>
      _AppointmentsScheduleFormState();
}

enum FilterStatus { upcoming, complete, cancel }

class _AppointmentsScheduleFormState extends State<AppointmentsScheduleForm> {
  FilterStatus status = FilterStatus.upcoming;
  Alignment _alignment = Alignment.centerLeft;

  List<dynamic> schedules = [
    {
      "doctor_name": "Ahmet Karaman",
      "doctor_profile": "assets/images/doctor1.jpg",
      "category": "Dental",
      "status": FilterStatus.upcoming
    },
    {
      "doctor_name": "Yusuf Sümer",
      "doctor_profile": "assets/images/doctor2.jpg",
      "category": "Dental",
      "status": FilterStatus.complete
    },
    {
      "doctor_name": "Nisa Nur Us",
      "doctor_profile": "assets/images/doctor3.jpg",
      "category": "Dental",
      "status": FilterStatus.cancel
    },
    {
      "doctor_name": "Nursu Altınışık",
      "doctor_profile": "assets/images/doctor4.jpg",
      "category": "Cardiology",
      "status": FilterStatus.cancel
    }
  ];

  @override
  Widget build(BuildContext context) {
    List<dynamic> filteredSchedules = schedules.where((var schedule) {
      // switch (schedule['status']) {
      //   case 'upcoming':
      //     schedule['status'] = FilterStatus.upcoming;
      //     break;
      //   case 'complete':
      //     schedule['status'] = FilterStatus.complete;
      //     break;
      //   case 'cancel':
      //     schedule['status'] = FilterStatus.cancel;
      //     break;
      // }
      return schedule['status'] == status;
    }).toList();
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(left: 20, top: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Appointment Schedule",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      for (FilterStatus filterStatus in FilterStatus.values)
                        Expanded(
                            child: GestureDetector(
                          onTap: () {
                            setState(() {
                              if (filterStatus == FilterStatus.upcoming) {
                                status = FilterStatus.upcoming;
                                _alignment = Alignment.centerLeft;
                              } else if (filterStatus ==
                                  FilterStatus.complete) {
                                status = FilterStatus.complete;
                                _alignment = Alignment.center;
                              } else if (filterStatus == FilterStatus.cancel) {
                                status = FilterStatus.cancel;
                                _alignment = Alignment.centerRight;
                              }
                            });
                          },
                          child: Center(child: Text(filterStatus.name)),
                        ))
                    ],
                  ),
                ),
                AnimatedAlign(
                  alignment: _alignment,
                  duration: Duration(milliseconds: 200),
                  child: Container(
                    width: 100,
                    height: 40,
                    decoration: BoxDecoration(
                      color: kPrimaryLightColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                        child: Text(
                      status.name,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: filteredSchedules.length,
                    itemBuilder: ((context, index) {
                      var _schedule = filteredSchedules[index];
                      bool isLastElement =
                          filteredSchedules.length + 1 == index;
                      return Card(
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(20)),
                        margin: !isLastElement
                            ? EdgeInsets.only(bottom: 20)
                            : EdgeInsets.zero,
                        child: Padding(
                          padding: EdgeInsets.all(15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    backgroundImage:
                                        AssetImage(_schedule['doctor_profile']),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        _schedule['doctor_name'],
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(_schedule['category'])
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              ScheduleCard(),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                      child: OutlinedButton(
                                    onPressed: () {},
                                    child: Text('Cancel',
                                        style: TextStyle(color: kPrimaryColor)),
                                  )),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                      child: OutlinedButton(
                                    style: OutlinedButton.styleFrom(
                                        backgroundColor: kPrimaryLightColor),
                                    onPressed: () {},
                                    child: Text('Reschedule',
                                        style: TextStyle(color: Colors.white)),
                                  ))
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    })))
          ],
        ),
      ),
    );
  }
}

class ScheduleCard extends StatelessWidget {
  const ScheduleCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: kPrimaryColor, borderRadius: BorderRadius.circular(10)),
      width: double.infinity,
      padding: EdgeInsets.all(20),
      child: Row(children: const <Widget>[
        Icon(
          Icons.calendar_today,
          color: Colors.white,
          size: 15,
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          "Monday, 12/26/2022",
          style: TextStyle(color: Colors.white),
        ),
        SizedBox(
          width: 20,
        ),
        Icon(
          Icons.access_alarm,
          color: Colors.white,
          size: 17,
        ),
        SizedBox(
          width: 5,
        ),
        Flexible(
            child: Text(
          "2:00 PM",
          style: TextStyle(color: Colors.white),
        ))
      ]),
    );
  }
}
