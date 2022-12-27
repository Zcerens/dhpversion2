import 'package:dhpversion2/Pages/MainPage/components/branch_btn.dart';
import 'package:dhpversion2/Pages/MainPage/components/doctor_btn.dart';
import 'package:dhpversion2/const/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainForm extends StatefulWidget {
  @override
  State<MainForm> createState() => _MainFormState();
}

class _MainFormState extends State<MainForm> {
  List<String> userAvatar = [
    "https://randomuser.me/api/portraits/women/65.jpg",
    "https://randomuser.me/api/portraits/men/67.jpg",
    "https://randomuser.me/api/portraits/men/21.jpg",
    "https://randomuser.me/api/portraits/women/39.jpg"
  ];
  List<String> branches = [
    "Kulak",
    "Cildiye",
    "Kalp",
    "Psikoloji",
    "Kadın Hastalıkları",
    "Kardiyoloji"
  ];
  List<String> doctors = [
    "Bulent Hoca",
    "Servet Hoca",
    "Ceren Sahin",
    "Ozlem Kucuksagir",
    "XXX YY"
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 25, horizontal: 20),
          child: Container(
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      color: kPrimaryColor,
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: Offset(0, 3)),
                ]),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(children: [
                Icon(
                  CupertinoIcons.search,
                  color: kPrimaryColor,
                ),
                Container(
                  height: 50,
                  width: 300,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintText: "Look for branch, doctor or disease..",
                          border: InputBorder.none,
                          fillColor: Colors.white),
                    ),
                  ),
                )
              ]),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0),
          child: Row(
            children: [
              Text(
                "Find a doctor, \nmake an appointment.",
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: 35,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0),
          child: Text(
            "interview online.",
            textAlign: TextAlign.start,
            style: TextStyle(
                fontSize: 35,
                color: kPrimaryColor,
                fontWeight: FontWeight.w500),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          width: MediaQuery.of(context).size.width, // EKRANIN GENİŞLİĞİ

          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(left: 10.0),
          child: Text(
            "Populer Branches",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: kPrimaryColor),
          ),
        ),
        populerBranches(),
        Container(
          width: MediaQuery.of(context).size.width, // EKRANIN GENİŞLİĞİ
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(left: 10.0),
          child: Text(
            "Populer Doctors",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: kPrimaryColor),
          ),
        ),
        populerDoctors(),
      ]),
    );
  }

  Widget populerBranches() => Container(
        height: 200,
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: branches.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    height: 150,
                    width: 100,
                    margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                              color: kPrimaryColor,
                              blurRadius: 4,
                              spreadRadius: 2)
                        ]),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              InkWell(
                                onTap: () {},
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15),
                                  ),
                                  child: branchButton(branches[index]),
                                ),
                              )
                            ],
                          )
                        ]),
                  )
                ],
              );
            }),
      );

  Widget populerDoctors() => Container(
        height: 340,
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: doctors.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    height: 250,
                    width: 150,
                    margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                              color: kPrimaryColor,
                              blurRadius: 4,
                              spreadRadius: 2)
                        ]),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              InkWell(
                                onTap: () {},
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15),
                                  ),
                                  child: Image.asset(
                                    "assets/images/doctor${index + 1}.jpg",
                                    width: 180,
                                    height: 180,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topRight,
                                child: Container(
                                  margin: EdgeInsets.all(5),
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                            color: kPrimaryLightColor,
                                            blurRadius: 4,
                                            spreadRadius: 2)
                                      ]),
                                  child: Center(
                                    child: Icon(
                                      Icons.favorite_outline,
                                      color: kPrimaryColor,
                                      size: 25,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 1),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  doctors[index],
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              ],
                            ),
                          )
                        ]),
                  )
                ],
              );
            }),
      );
}
