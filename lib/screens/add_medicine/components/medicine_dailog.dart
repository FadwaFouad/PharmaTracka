import 'package:flutter/material.dart';
import 'package:pharm_traka/screens/add_medicine/components/confirm_button.dart';

class MedicineDialog extends StatelessWidget {
  const MedicineDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      backgroundColor: Color.fromARGB(255, 214, 241, 215),
      elevation: 100,
      title: Column(children: [
        SizedBox(
            width: 100,
            height: 100,
            child: Image.asset('assets/images/capsule.png')),
        Text(
          'Centrum',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(
          'Added to your medicine ',
          style: TextStyle(fontSize: 15),
        )
      ]),
      children: [
        SimpleDialogOption(
          child: confirmButton(
              context: context, title: 'Add new medicine', function: () {}),
        ),
        SimpleDialogOption(
          child: InkWell(
            onTap: () {},
            child: Text(
              'Go back to homepage',
              style:
                  TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}
