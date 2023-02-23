import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pharm_traka/screens/home/components/text_title.dart';

class DayTips extends StatelessWidget {
  const DayTips({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextTitle(title: 'Tip of the day'),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.green,
          ),
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          child: Text(
            'Be sure to take your medications correctly to get the most out of them and to reduce your risk of side effects',
            style: TextStyle(color: Colors.green.shade100),
          ),
        ),
      ],
    );
  }
}
