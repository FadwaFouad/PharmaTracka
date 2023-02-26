import 'package:flutter/material.dart';

class MedicineTime extends StatefulWidget {
  const MedicineTime({super.key});

  @override
  State<MedicineTime> createState() => _MedicineTimeState();
}

class _MedicineTimeState extends State<MedicineTime> {
  DateTime dateToday =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  TimeOfDay timeOfDay =
      TimeOfDay(hour: DateTime.now().hour, minute: DateTime.now().minute);

  @override
  Widget build(BuildContext context) {
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
          initialDate: dateToday,
          firstDate: DateTime(2000),
          lastDate: DateTime(2100),
        );
        if (newDate == null) return;
        setState(() {
          dateToday = newDate;
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
          '${dateToday.year}/${dateToday.month}/${dateToday.day}',
          style: TextStyle(color: Colors.grey.shade700, fontSize: 17),
        ),
      ),
    );
  }

  Widget getTime() {
    return InkWell(
      onTap: (() async {
        TimeOfDay? newTime =
            await showTimePicker(context: context, initialTime: timeOfDay);
        if (newTime == null) return;
        setState(() {
          timeOfDay = newTime;
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
          '${timeOfDay.format(context)}',
          // show time with 2 pad 0
          //'${timeOfDay.hour.toString().padLeft(2, '0')}:${timeOfDay.minute.toString().padLeft(2, '0')}',
          style: TextStyle(color: Colors.grey.shade700, fontSize: 17),
        ),
      ),
    );
  }
}
