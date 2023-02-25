import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MedicineDialog extends StatelessWidget {
  const MedicineDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Image.asset('assets/images/capsule.png'),
    );
  }
}
