import 'package:flutter/material.dart';
import 'package:pharm_traka/data/models/medicine.dart';

class MedicineData {
  List<Medicine> list = [
    Medicine(
        date: DateTime(2023, 3, 1),
        time: TimeOfDay(hour: 20, minute: 0),
        doseAmount: 120,
        doseNum: 2,
        image: 'assets/images/capsule.png',
        name: 'Malaria'),
    Medicine(
        date: DateTime(2023, 3, 1),
        time: TimeOfDay(hour: 22, minute: 0),
        doseAmount: 100,
        doseNum: 1,
        image: 'assets/images/dose.png',
        name: 'Vatimen C'),
  ];
}
