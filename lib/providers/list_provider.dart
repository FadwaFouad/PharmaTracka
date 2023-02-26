import 'package:flutter/material.dart';
import 'package:pharm_traka/data/models/medicine.dart';
import 'package:pharm_traka/data/repository/data.dart';

class ListProvider extends ChangeNotifier {
  List<Medicine> listOfMed = MedicineData().list;
  List<Medicine> listOfToday = MedicineData().list;

  void addNewMedicine(Medicine medicine) {
    listOfMed.add(medicine);
    notifyListeners();
  }

  void changeDate(DateTime date) {
    // remove hours to make compare
    DateTime newDate = DateTime(date.year, date.month, date.day);
    List<Medicine> list =
        listOfMed.where((element) => element.date == newDate).toList();
    listOfToday = list;
    notifyListeners();
  }

  List<Medicine> get getList => listOfMed;
  List<Medicine> get getTodayList => listOfToday;
}
