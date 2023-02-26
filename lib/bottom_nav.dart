// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pharm_traka/providers/list_provider.dart';
import 'package:pharm_traka/providers/navigation_provider.dart';
import 'package:pharm_traka/screens/add_medicine/add_medicine.dart';
import 'package:pharm_traka/screens/profile/profile.dart';
import 'package:pharm_traka/screens/reminder/reminder.dart';
import 'package:provider/provider.dart';

import 'screens/home/home_screen.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  @override
  Widget build(BuildContext context) {
    int currentIndex = context.watch<NavigationProvider>().getCurrentIndex;

    return ChangeNotifierProvider(
      create: (context) => ListProvider(),
      child: Scaffold(
        body: IndexedStack(
          index: currentIndex,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            HomePage(),
            AddMedicine(),
            ReminderPage(),
            Profile(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: currentIndex,
            onTap: ((index) => setState(() {
                  context.read<NavigationProvider>().setCurrentIndex(index);
                  //_currentIndex = index;
                })),
            // ignore: prefer_const_literals_to_create_immutables
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add_circle_outline),
                label: "Add",
              ),
              BottomNavigationBarItem(
                icon: FaIcon(Icons.calendar_month_rounded),
                label: "Reminder",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "Profile",
              ),
            ]),
      ),
    );
  }
}
