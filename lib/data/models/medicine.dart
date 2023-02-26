import 'package:flutter/material.dart';

class Medicine {
  String name;
  String image;
  DateTime date;
  TimeOfDay time;
  int doseNum;
  int doseAmount;

  Medicine(
      {required this.name,
      required this.date,
      required this.doseAmount,
      required this.image,
      required this.doseNum,
      required this.time});
}
