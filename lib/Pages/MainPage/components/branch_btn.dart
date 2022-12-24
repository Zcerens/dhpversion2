import 'package:dhpversion2/const/constant.dart';
import 'package:flutter/material.dart';

Widget branchButton(String branchName) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 10),
    child: Column(children: [
      Text(branchName, style: TextStyle(fontSize: 20, color: kPrimaryColor)),
      Container(
        width: 80,
        height: 80,
      )
    ]),
  );
}
