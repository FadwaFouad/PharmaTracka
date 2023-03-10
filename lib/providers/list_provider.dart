import 'package:flutter/material.dart';
import 'package:pharm_traka/data/models/medicine.dart';

class ListProvider extends ChangeNotifier {
  List<Medicine> _listOfMed = [];
  List<Medicine>? _changedList;
  List<Medicine> _listOfToday = [];

  void addNewMedicine(Medicine medicine) {
    _listOfMed.add(medicine);
    notifyListeners();
  }

  void todayList() {
    DateTime today =
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
    List<Medicine> list =
        _listOfMed.where((element) => element.date == today).toList();
    _listOfToday = list;
  }

  void changeDate(DateTime date) {
    List<Medicine> list = [];
    // remove hours to make compare
    DateTime newDate = DateTime(date.year, date.month, date.day);
    list = _listOfMed.where((element) => element.date == newDate).toList();
    _changedList = list;
    notifyListeners();
  }

  List<Medicine> get getAllList => _listOfMed;
  List<Medicine>? get getChangedList => _changedList;
  List<Medicine> get getTodayList => _listOfToday;
}
