import 'package:flutter/material.dart';
import 'package:pharm_traka/data/models/medicine.dart';

class ListProvider extends ChangeNotifier {
  List<Medicine> listOfMed = [];
  List<Medicine> changedList = [];
  List<Medicine> listOfToday = [];

  void addNewMedicine(Medicine medicine) {
    listOfMed.add(medicine);
    notifyListeners();
  }

  List<Medicine> getTodayList() {
    DateTime today =
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
    List<Medicine> list =
        listOfMed.where((element) => element.date == today).toList();
    return list;
  }

  void changeDate(DateTime date) {
    // remove hours to make compare
    DateTime newDate = DateTime(date.year, date.month, date.day);
    List<Medicine> list =
        listOfMed.where((element) => element.date == newDate).toList();
    changedList = list;
    notifyListeners();
  }

  List<Medicine> get getList => listOfMed;
  List<Medicine> get getChangedList => changedList;
}
