import 'package:flutter/material.dart';
import 'package:pharm_traka/data/models/medicine.dart';
import 'package:pharm_traka/providers/list_provider.dart';
import 'package:provider/provider.dart';
import '../../providers/navigation_provider.dart';
import 'components.dart/calender_section.dart';

class ReminderPage extends StatefulWidget {
  const ReminderPage({super.key});

  @override
  State<ReminderPage> createState() => _ReminderPageState();
}

class _ReminderPageState extends State<ReminderPage> {
  @override
  Widget build(BuildContext context) {
    List<Medicine> list = context.watch<ListProvider>().getTodayList;

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
              Expanded(child: getMedicineList(list)),
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

  Widget getMedicineList(List<Medicine> list) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) => getMedicineInfo(
        '${list[index].time.format(context)}',
        '${list[index].image}',
        '${list[index].name}',
        list[index].doseNum,
      ),
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
