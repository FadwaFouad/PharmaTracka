import 'package:flutter/material.dart';
import 'package:pharm_traka/bottom_nav.dart';
import 'package:pharm_traka/screens/add_medicine/components/confirm_button.dart';
import 'package:provider/provider.dart';

import '../../../providers/navigation_provider.dart';

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
            context: context,
            title: 'Add new medicine',
          ),
        ),
        SimpleDialogOption(
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
              // navigate home page
              context.read<NavigationProvider>().setCurrentIndex(0);
              // dismiss keyboard
              FocusManager.instance.primaryFocus?.unfocus();
            },
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
