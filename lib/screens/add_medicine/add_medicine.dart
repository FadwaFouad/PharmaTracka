// ignore_for_file: prefer_const_constructors

import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:pharm_traka/data/models/medicine.dart';
import 'package:pharm_traka/providers/list_provider.dart';
import 'package:pharm_traka/screens/add_medicine/components/medicine_dailog.dart';
import 'package:provider/provider.dart';

import '../../providers/notify_dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

class AddMedicine extends StatefulWidget {
  const AddMedicine({super.key});

  @override
  State<AddMedicine> createState() => _AddMedicineState();
}

class _AddMedicineState extends State<AddMedicine> {
  // global key for form
  final _formKey = GlobalKey<FormState>();
  // alaram id
  int _alarmkId = 1;
  // group for radio buttons
  int? group = 1;
  // inilize forms feilds
  String medName = "";
  String doseAmount = '100';
  String doseNum = '1';
  TextEditingController nameController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController numController = TextEditingController();
  DateTime medDate =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  TimeOfDay medTime =
      TimeOfDay(hour: DateTime.now().hour, minute: DateTime.now().minute);

  @override
  void initState() {
    super.initState();
    MedicineNotify.initialize(flutterLocalNotificationsPlugin);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              height: MediaQuery.of(context).size.height - 10,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Text(
                    'Add new reminder',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  TextTitle('Name of pill'),
                  SizedBox(height: 5),
                  Text(
                    'Enter the name of medicine',
                    style: TextStyle(color: Colors.grey.shade700),
                  ),
                  nameInputText(),
                  SizedBox(height: 10),
                  SizedBox(height: 20),
                  TextTitle('Appearance of pill'),
                  SizedBox(height: 15),
                  buildMedicineBtnRow(),
                  SizedBox(height: 40),
                  Row(
                    children: [
                      TextTitle('or take picture'),
                      SizedBox(width: 10),
                      InkWell(
                        onTap: () {},
                        child: Icon(
                          Icons.camera_alt_sharp,
                          color: Colors.green.shade800,
                          size: 50,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  TextTitle('Date/Time'),
                  SizedBox(height: 5),
                  getMedicineTime(),
                  SizedBox(height: 20),
                  TextTitle('Dosage'),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(child: amountInputText()),
                      SizedBox(width: 10),
                      Expanded(child: doseNumInputText()),
                    ],
                  ),
                  SizedBox(height: 20),
                  confirmButtonStyle(context, 'set reminder'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void clearForm() {
    setState(() {
      // group for radio buttons
      group = 1;
      // inilize forms feilds
      medName = "";
      nameController.clear();
      amountController.clear();
      numController.clear();
      medDate = DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day);
      medTime =
          TimeOfDay(hour: DateTime.now().hour, minute: DateTime.now().minute);
      doseAmount = '100';
      doseNum = '1';
      FocusManager.instance.primaryFocus?.unfocus();
    });
  }

  Widget getMedicineTime() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        getDate(),
        const SizedBox(width: 10),
        getTime(),
      ],
    );
  }

  Widget getDate() {
    return InkWell(
      onTap: (() async {
        DateTime? newDate = await showDatePicker(
          context: context,
          initialDate: medDate,
          firstDate: DateTime(2000),
          lastDate: DateTime(2100),
        );
        if (newDate == null) return;
        setState(() {
          medDate = newDate;
        });
      }),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.4,
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          '${medDate.year}/${medDate.month}/${medDate.day}',
          style: TextStyle(color: Colors.grey.shade700, fontSize: 17),
        ),
      ),
    );
  }

  Widget getTime() {
    return InkWell(
      onTap: (() async {
        TimeOfDay? newTime =
            await showTimePicker(context: context, initialTime: medTime);
        if (newTime == null) return;
        setState(() {
          medTime = newTime;
        });
      }),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.4,
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          '${medTime.format(context)}',
          style: TextStyle(color: Colors.grey.shade700, fontSize: 17),
        ),
      ),
    );
  }

  Widget confirmButtonStyle(BuildContext context, title) {
    return Container(
      padding: EdgeInsets.only(top: 3, left: 3),
      child: MaterialButton(
        minWidth: double.infinity,
        height: 60,
        onPressed: pressConfirmButton,
        color: Colors.green.shade400,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        child: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  void pressConfirmButton() {
    //if form validation success
    if (_formKey.currentState!.validate()) {
      //save medicine tolist
      Medicine medicine = Medicine(
          name: medName,
          date: medDate,
          doseAmount: int.parse(doseAmount),
          image: getMedicineImage(),
          doseNum: int.parse(doseNum),
          time: medTime);
      context.read<ListProvider>().addNewMedicine(medicine);

      // set alarm for medicine on time
      setAlarm(_alarmkId++);

      // popup confirm dialog
      Navigator.push(
          context,
          PageRouteBuilder(
              pageBuilder: (context, _, __) =>
                  MedicineDialog(medicine: medicine),
              opaque: false));

      // clear form from data
      clearForm();
    }
  }

  static void showNotify(Map<String, dynamic> params) {
    MedicineNotify.showBigTextNotification(
      title: 'Don\'t forget take Medicine',
      body: '${params['name']}- ${params['count']} pills',
      fln: flutterLocalNotificationsPlugin,
    );
  }

  void setAlarm(int id) async {
    DateTime alarmDate = DateTime(
        medDate.year, medDate.month, medDate.day, medTime.hour, medTime.minute);
    Map<String, dynamic> medParams = {'name': medName, 'count': doseNum};
    await AndroidAlarmManager.oneShotAt(alarmDate, id, alarmCallback,
        params: medParams);
  }

  static void alarmCallback(id, Map<String, dynamic> params) {
    print('set alaram');

    showNotify(params);
  }

  String getMedicineImage() {
    String image = 'assets/images/capsule.png';
    switch (group) {
      case 1:
        image = 'assets/images/capsule.png';
        break;
      case 2:
        image = 'assets/images/injection.png';
        break;
      case 3:
        image = 'assets/images/dose.png';
        break;
    }
    return image;
  }

  Widget nameInputText() {
    return Container(
      padding: EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextFormField(
        controller: nameController,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter name';
          }
          return null;
        },
        onChanged: (value) => medName = value,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintStyle: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }

  Widget amountInputText() {
    return Container(
      padding: EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextFormField(
        controller: amountController,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return ' enter amount';
          } else {
            if (!RegExp(r'^[0-9]*$').hasMatch(value)) {
              return 'enter valid amount';
            }
          }
          return null;
        },
        onChanged: (value) => doseAmount = value,
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          hintText: '100mg',
          border: InputBorder.none,
          hintStyle: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }

  Widget doseNumInputText() {
    return Container(
      padding: EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextFormField(
        controller: numController,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return ' enter count';
          } else {
            if (!RegExp(r'^[0-9]*$').hasMatch(value)) {
              return 'enter valid count';
            }
          }
          return null;
        },
        onChanged: (value) => setState(() {
          doseNum = value;
        }),
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          hintText: 'Count: 1',
          border: InputBorder.none,
          hintStyle: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }

  Widget TextTitle(String text) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.green,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget buildMedicineBtn(Function onTap, AssetImage logo) {
    return GestureDetector(
      child: Container(
        height: 45.0,
        width: 45.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey.shade300,
          image: DecorationImage(
            image: logo,
          ),
        ),
      ),
    );
  }

  Widget buildMedicineBtnRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Row(
          children: [
            Radio(
              value: 1,
              groupValue: group,
              onChanged: (value) {
                setState(() {
                  group = value;
                });
              },
            ),
            buildMedicineBtn(
              () {},
              AssetImage(
                'assets/images/capsule.png',
              ),
            ),
          ],
        ),
        Row(
          children: [
            Radio(
              value: 2,
              groupValue: group,
              onChanged: (value) {
                setState(() {
                  group = value;
                });
              },
            ),
            buildMedicineBtn(
              () {},
              AssetImage(
                'assets/images/injection.png',
              ),
            ),
          ],
        ),
        Row(
          children: [
            Radio(
              value: 3,
              groupValue: group,
              onChanged: (value) {
                setState(() {
                  group = value;
                });
              },
            ),
            buildMedicineBtn(
              () {},
              AssetImage(
                'assets/images/dose.png',
              ),
            ),
          ],
        ),
      ],
    );
  }
}
