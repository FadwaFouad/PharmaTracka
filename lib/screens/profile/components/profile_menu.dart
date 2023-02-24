import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        InkWell(
            onTap: () {},
            child: menuItem(Icons.person_search_sharp, 'My Profile')),
        SizedBox(height: 10),
        menuItem(Icons.medical_information_sharp, 'My medicine'),
        SizedBox(height: 10),
        menuItem(Icons.wine_bar_rounded, 'rewards notice'),
        SizedBox(height: 10),
        menuItem(Icons.people, 'Add caregiver'),
        SizedBox(height: 10),
        menuItem(Icons.settings, 'Settings'),
      ],
    );
  }

  Widget menuItem(IconData icon, String name) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: Colors.green.shade100,
          )),
      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.green.shade400,
        ),
        title: Text(
          name,
        ),
        trailing: Icon(Icons.arrow_forward_ios_sharp),
      ),
    );
  }
}
