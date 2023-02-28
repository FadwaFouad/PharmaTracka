import 'package:flutter/material.dart';
import 'package:pharm_traka/data/models/medicine.dart';
import 'package:pharm_traka/providers/list_provider.dart';
import 'package:pharm_traka/screens/home/components/search.dart';
import 'package:pharm_traka/screens/home/components/text_title.dart';
import 'package:pharm_traka/screens/home/components/tips.dart';
import 'package:pharm_traka/screens/home/components/user_avatar.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Medicine> list = context.watch<ListProvider>().getTodayList();
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            User(),
            SizedBox(height: 10),
            DayTips(),
            SizedBox(height: 5),
            SearchBar(),
            SizedBox(height: 15),
            TextTitle(title: 'Today’s Medication'),
            SizedBox(height: 5),
            Expanded(
              child: ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) => Card(
                  elevation: 2,
                  child: ListTile(
                    leading: Icon(
                      Icons.medication_rounded,
                      color: Colors.yellow.shade600,
                    ),
                    title: Text(list[index].name),
                    subtitle: Text(
                        '${list[index].doseAmount}mg daily, ${list[index].doseNum} pill'),
                    trailing: Text(
                      '${(list[index].time).format(context)}',
                      style: TextStyle(fontWeight: FontWeight.w300),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
