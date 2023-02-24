import 'package:flutter/material.dart';

class InfoBar extends StatelessWidget {
  const InfoBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          infoDetails(51, 'pills added'),
          infoDetails(45, 'pills taken'),
          infoDetails(6, 'pills missed'),
        ],
      ),
    );
  }

  Widget infoDetails(int num, String text) {
    return Container(
      height: 70,
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.green.shade100,
      ),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          '$num',
          style: TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
        Text(
          text,
          style: TextStyle(
            color: Colors.green.shade400,
            fontSize: 12,
          ),
        ),
      ]),
    );
  }
}
