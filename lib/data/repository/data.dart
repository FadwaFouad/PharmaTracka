import 'package:flutter/material.dart';
import 'package:pharm_traka/data/models/medicine.dart';

class MedicineData {
  List<Medicine> list = [
    Medicine(
        date: DateTime(2023, 3, 1),
        time: TimeOfDay(hour: 13, minute: 5),
        doseAmount: 120,
        doseNum: 2,
        image: 'assets/images/capsule.png',
        name: 'Malaria'),
    Medicine(
        date: DateTime(2023, 3, 1),
        time: TimeOfDay(hour: 13, minute: 5),
        doseAmount: 120,
        doseNum: 2,
        image: 'assets/images/capsule.png',
        name: 'Vatimen C'),
  ];
}
