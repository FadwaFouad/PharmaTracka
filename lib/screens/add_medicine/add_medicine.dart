// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:pharm_traka/screens/add_medicine/components/medicine_dailog.dart';

import '../../providers/notify_dart';
import 'components/medicine_time.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

class AddMedicine extends StatefulWidget {
  const AddMedicine({super.key});

  @override
  State<AddMedicine> createState() => _AddMedicineState();

  static Widget buildMedicineBtn(Function onTap, AssetImage logo) {
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

  static Widget buildMedicineBtnRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        buildMedicineBtn(
          () {},
          AssetImage(
            'assets/images/capsule.png',
          ),
        ),
        buildMedicineBtn(
          () {},
          AssetImage(
            'assets/images/injection.png',
          ),
        ),
        buildMedicineBtn(
          () {},
          AssetImage(
            'assets/images/dose.png',
          ),
        ),
      ],
    );
  }
}

class _AddMedicineState extends State<AddMedicine> {
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
                InputText(""),
                SizedBox(height: 10),
                SizedBox(height: 20),
                TextTitle('Appearance of pill'),
                SizedBox(height: 15),
                AddMedicine.buildMedicineBtnRow(),
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
                MedicineTime(),
                SizedBox(height: 20),
                TextTitle('Dosage'),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(child: InputText('Num: 1')),
                    SizedBox(width: 10),
                    Expanded(child: InputText("120mg")),
                  ],
                ),
                SizedBox(height: 20),
                confirmButton(context, 'set reminder'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget InputText(String hint) {
    return Container(
      padding: EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintStyle: TextStyle(color: Colors.grey),
          hintText: hint,
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

  Widget confirmButton(context, title) {
    return Container(
      padding: EdgeInsets.only(top: 3, left: 3),
      child: MaterialButton(
        minWidth: double.infinity,
        height: 60,
        onPressed: () {
          MedicineNotify.showBigTextNotification(
            title: 'Don\'t forget take Medicine',
            body: 'Centrum- 1 pills',
            fln: flutterLocalNotificationsPlugin,
          );
          Navigator.push(
              context,
              PageRouteBuilder(
                  pageBuilder: (context, _, __) => const MedicineDialog(),
                  opaque: false));
        },
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

  Widget unRowMed() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        Expanded(
            child: CircleAvatar(
                radius: 25,
                foregroundImage: AssetImage(
                  'assets/images/injection.png',
                ))),
        Expanded(
            child: CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage('assets/images/capsule.png'))),
        Expanded(
            child: CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage('assets/images/dose.png'))),
      ],
    );
  }
}
