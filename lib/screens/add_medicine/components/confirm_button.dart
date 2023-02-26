import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/navigation_provider.dart';

class confirmButton extends StatelessWidget {
  const confirmButton({
    super.key,
    required this.title,
    required this.context,
  });
  final String title;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 3, left: 3),
      child: MaterialButton(
        minWidth: double.infinity,
        height: 60,
        onPressed: () {
          Navigator.pop(context);
        },
        color: Colors.green.shade400,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        child: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
