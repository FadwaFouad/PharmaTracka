import 'package:flutter/material.dart';

class ProfileBar extends StatelessWidget {
  const ProfileBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 45,
          backgroundImage: AssetImage(
            "assets/images/profile.jpg",
          ),
        ),
        SizedBox(height: 5),
        Text(
          'Jon Dua',
          style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.wine_bar_rounded,
              color: Colors.yellow,
            ),
            Text(
              'Pro',
              style: TextStyle(color: Colors.green),
            ),
          ],
        ),
      ],
    );
  }
}
