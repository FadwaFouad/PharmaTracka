import 'package:flutter/material.dart';
import 'package:pharm_traka/bottom_nav.dart';
import 'package:pharm_traka/screens/login/components/helper.dart';
import 'package:pharm_traka/screens/login/signup_screen.dart';
import 'package:provider/provider.dart';

import '../../providers/auth_provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // global key for form
  final _formKey = GlobalKey<FormState>();
  bool passwordVisible = false;

  String email = '';
  String? password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                logo(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 15),
                    titleStyle("Email address"),
                    SizedBox(height: 5),
                    emailText(),
                    SizedBox(
                      height: 10,
                    ),
                    titleStyle("Password"),
                    SizedBox(height: 5),
                    passwordText(),
                    const SizedBox(height: 40),
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(top: 3, left: 3),
                  child: MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: () async {
                      FocusManager.instance.primaryFocus?.unfocus();
                      if (_formKey.currentState!.validate()) {
                        // sign in to firebase
                        String? isLogin =
                            await context.read<AuthProvider>().signIn(
                                  email: email.trim(),
                                  password: password!.trim(),
                                );

                        // nav to main screen
                        if (isLogin == 'Signed')
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const BottomNav()));
                        else {
                          var snackBar = SnackBar(content: Text(isLogin!));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      }
                    },
                    color: Colors.green.shade500,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const Text(
                      "Sign in",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                const Text("or continue with"),
                const SizedBox(height: 10),
                Helper.buildSocialBtnRow(),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text("Don't have an account?"),
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignupPage()));
                      },
                      child: const Text(
                        " Sign up",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            color: Colors.green),
                      ),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget emailText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'please enter email';
            } else if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
              return 'please enter valid email';
            }
            email = value;
            return null;
          },
          decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.email,
                color: Colors.green.shade200,
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 5),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400),
              ),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade400))),
        ),
        SizedBox(height: 5),
      ],
    );
  }

  Widget logo() {
    return Column(
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
        ),
      ],
    );
  }

  Widget titleStyle(String label) {
    return Text(
      label,
      style: TextStyle(
          fontSize: 15, fontWeight: FontWeight.w500, color: Colors.black87),
    );
  }

  Widget passwordText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextFormField(
          obscureText: !passwordVisible,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'please enter password';
            }
            password = value;
            return null;
          },
          decoration: InputDecoration(
              suffixIcon: passwordIcon(),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.green.shade200,
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 5),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400),
              ),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade400))),
        ),
        SizedBox(
          height: 5,
        )
      ],
    );
  }

  Widget passwordIcon() {
    return IconButton(
      icon: Icon(passwordVisible ? Icons.visibility_off : Icons.visibility),
      onPressed: () {
        setState(
          () {
            passwordVisible = !passwordVisible;
          },
        );
      },
    );
  }
}
