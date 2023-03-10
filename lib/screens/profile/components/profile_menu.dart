import 'package:flutter/material.dart';
import 'package:pharm_traka/main.dart';
import 'package:pharm_traka/screens/all_medicine/all_medince_screen.dart';
import 'package:provider/provider.dart';

import '../../../providers/auth_provider.dart';
import '../../../providers/navigation_provider.dart';

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
        InkWell(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AllMedicineList(),
                )),
            child: menuItem(Icons.medical_information_sharp, 'My medicine')),
        SizedBox(height: 10),
        menuItem(Icons.wine_bar_rounded, 'rewards notice'),
        SizedBox(height: 10),
        menuItem(Icons.people, 'Add caregiver'),
        SizedBox(height: 10),
        menuItem(Icons.settings, 'Settings'),
        SizedBox(height: 10),
        InkWell(
            // sign out from app
            onTap: () async {
              await context.read<AuthProvider>().signOut();
              // set defalut nav home
              context.read<NavigationProvider>().setCurrentIndex(0);
              // nav to authnitacte
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const Authenticate()));
            },
            child: menuItem(Icons.logout, 'Log Out')),
        SizedBox(height: 80),
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
