import 'package:flutter/material.dart';

import 'components/info_bar.dart';
import 'components/profile_bar.dart';
import 'components/profile_menu.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

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
              children: [
                SizedBox(height: 10),
                ProfileBar(),
                SizedBox(height: 20),
                InfoBar(),
                SizedBox(height: 70),
                Expanded(child: ProfileMenu()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
