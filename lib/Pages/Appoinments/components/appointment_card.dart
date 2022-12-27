import 'package:dhpversion2/const/constant.dart';
import 'package:flutter/material.dart';

class AppointmentCard extends StatefulWidget {
  const AppointmentCard({super.key});

  @override
  State<AppointmentCard> createState() => _AppointmentCardState();
}

class _AppointmentCardState extends State<AppointmentCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: kPrimaryLightColor, borderRadius: BorderRadius.circular(10)),
      child: Material(
        color: Colors.transparent,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(children: <Widget>[
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(
                      "assets\\images\\doctor1.jpg"), //insert doctor profile
                ),
                SizedBox(width: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Doctor Name",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text("dental", style: TextStyle(color: Colors.white))
                  ],
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            ScheduleCard(),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  child: Text("Cancel"),
                  onPressed: () {},
                )),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  child: Text("Completed"),
                  onPressed: () {},
                ))
              ],
            )
          ]),
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


//the information/data here will be replaced by API data after database setup