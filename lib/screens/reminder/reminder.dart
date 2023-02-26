import 'package:flutter/material.dart';
import 'package:pharm_traka/screens/add_medicine/add_medicine.dart';
import 'package:provider/provider.dart';
import '../../providers/navigation_provider.dart';
import 'components.dart/calender_section.dart';

class ReminderPage extends StatelessWidget {
  const ReminderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
            child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          height: MediaQuery.of(context).size.height - 10,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.arrow_back_rounded),
                  Icon(Icons.notifications_active_outlined),
                ],
              ),
              SizedBox(height: 20),
              getTitle("Reminder"),
              SizedBox(height: 10),
              CalenderSection(),
              SizedBox(height: 20),
              getTitle("Upcoming reminder"),
              SizedBox(height: 10),
              Expanded(child: getMedicineList()),
            ],
          ),
        )),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              context.read<NavigationProvider>().setCurrentIndex(1);
            }),
      ),
    );
  }

  Widget getTitle(String text) {
    return Text(
      text,
      style: TextStyle(fontWeight: FontWeight.bold),
    );
  }

  Widget getMedicineList() {
    return ListView(
      children: [
        getMedicineInfo(
            '9.00am', 'assets/images/capsule.png', 'Tetracyclin', 2),
        Text(
          '10.00am',
          style: TextStyle(color: Colors.grey.shade600),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          '11.00am',
          style: TextStyle(color: Colors.grey.shade600),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          '12.00pm',
          style: TextStyle(color: Colors.grey.shade600),
        ),
        SizedBox(
          height: 20,
        ),
        getMedicineInfo('1.00pm', 'assets/images/dose.png', 'Vitamin C', 1),
      ],
    );
  }

  Widget getMedicineInfo(String time, String image, String title, int num) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          time,
          style: TextStyle(color: Colors.grey.shade600),
        ),
        Container(
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey.shade200,
          ),
          width: 200,
          height: 80,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.grey.shade200,
              backgroundImage: AssetImage(image),
            ),
            title: Text(title),
            subtitle: Text('$num pills'),
          ),
        )
      ],
    );
  }
}
