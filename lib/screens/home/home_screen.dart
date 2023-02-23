import 'package:flutter/material.dart';
import 'package:pharm_traka/screens/home/components/search.dart';
import 'package:pharm_traka/screens/home/components/text_title.dart';
import 'package:pharm_traka/screens/home/components/tips.dart';
import 'package:pharm_traka/screens/home/components/user_avatar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
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
              child: ListView(
                children: [
                  Card(
                    elevation: 4,
                    child: ListTile(
                      leading: Icon(
                        Icons.medication_rounded,
                        color: Colors.yellow.shade600,
                      ),
                      title: Text('Valsartan'),
                      subtitle: Text('160mg daily, 1 pill'),
                      trailing: Text(
                        '8.00 PM',
                        style: TextStyle(fontWeight: FontWeight.w300),
                      ),
                    ),
                  ),
                  Card(
                    elevation: 4,
                    child: ListTile(
                      leading: Icon(
                        Icons.medication_rounded,
                        color: Colors.yellow.shade600,
                      ),
                      title: Text('Valsartan'),
                      subtitle: Text('160mg daily, 1 pill'),
                      trailing: Text(
                        '8.00 PM',
                        style: TextStyle(fontWeight: FontWeight.w300),
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.medication_rounded,
                      color: Colors.yellow.shade600,
                    ),
                    title: Text('Omeprazole'),
                    subtitle: Text('160mg daily, 1 pill'),
                    trailing: Text(
                      '8.00 PM',
                      style: TextStyle(fontWeight: FontWeight.w300),
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.medication_rounded,
                      color: Colors.yellow.shade600,
                    ),
                    title: Text('Hypoglycemia'),
                    subtitle: Text('160mg daily, 1 pill'),
                    trailing: Text(
                      '8.00 PM',
                      style: TextStyle(fontWeight: FontWeight.w300),
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.medication_rounded,
                      color: Colors.yellow.shade600,
                    ),
                    title: Text('Ciprotab'),
                    subtitle: Text('160mg daily, 1 pill'),
                    trailing: Text(
                      '9.00 AM',
                      style: TextStyle(fontWeight: FontWeight.w300),
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.medication_rounded,
                      color: Colors.yellow.shade600,
                    ),
                    title: Text('Valsartan'),
                    subtitle: Text('160mg daily, 1 pill'),
                    trailing: Text(
                      '8.00 PM',
                      style: TextStyle(fontWeight: FontWeight.w300),
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.medication_rounded,
                      color: Colors.yellow.shade600,
                    ),
                    title: Text('Valsartan'),
                    subtitle: Text('160mg daily, 1 pill'),
                    trailing: Text(
                      '8.00 PM',
                      style: TextStyle(fontWeight: FontWeight.w300),
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.medication_rounded,
                      color: Colors.yellow.shade600,
                    ),
                    title: Text('Valsartan'),
                    subtitle: Text('160mg daily, 1 pill'),
                    trailing: Text(
                      '8.00 PM',
                      style: TextStyle(fontWeight: FontWeight.w300),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
