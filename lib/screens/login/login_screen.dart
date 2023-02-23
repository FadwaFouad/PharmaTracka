import 'package:flutter/material.dart';
import 'package:pharm_traka/screens/home/home_screen.dart';
import 'package:pharm_traka/screens/login/components/helper.dart';
import 'package:pharm_traka/screens/login/signup_screen.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          height: MediaQuery.of(context).size.height - 10,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Image.asset(
                    "assets/images/logo.png",
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Welcome",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade800),
                  ),
                  Text(
                    "Sign in to continue",
                    style: TextStyle(fontSize: 15, color: Colors.grey.shade800),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  Helper.inputFile(label: "Email address", icon: Icons.email),
                  SizedBox(
                    height: 10,
                  ),
                  Helper.inputFile(
                      label: "Password", icon: Icons.lock, obscureText: true),
                ],
              ),
              Container(
                padding: EdgeInsets.only(top: 3, left: 3),
                child: MaterialButton(
                  minWidth: double.infinity,
                  height: 60,
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()));
                  },
                  color: Colors.green.shade500,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Text(
                    "Sign in",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text("or continue with"),
              Helper.buildSocialBtnRow(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Don't have an account?"),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignupPage()));
                    },
                    child: Text(
                      " Sign up",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          color: Colors.green),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
