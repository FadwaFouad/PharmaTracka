import 'package:flutter/material.dart';
import 'package:pharm_traka/screens/profile/components/profile_bar.dart';

class RewardScreen extends StatelessWidget {
  const RewardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          height: MediaQuery.of(context).size.height - 10,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              ProfileBar(),
              SizedBox(height: 60),
              Image.asset(
                'assets/images/congrats.png',
                width: 200,
                height: 200,
              ),
              SizedBox(height: 20),
              Text(
                'Congratulations',
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'You have just earned a new badge',
                style: TextStyle(),
              ),
              SizedBox(height: 100),
              confirmButtonStyle(context),
            ],
          ),
        ),
      ),
    ));
  }

  Widget confirmButtonStyle(context) {
    return Container(
      padding: EdgeInsets.only(top: 3, left: 3),
      child: MaterialButton(
        minWidth: double.infinity,
        height: 60,
        onPressed: () => Navigator.pop(context),
        color: Colors.green.shade400,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        child: Text(
          'Back',
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
