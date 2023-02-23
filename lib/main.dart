import 'package:flutter/material.dart';
import 'package:pharm_traka/screens/login/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PharmaTracka',
      theme: ThemeData(
        fontFamily: 'RobotoSlab',
        primarySwatch: Colors.green,
      ),
      home: LoginPage(),
    );
  }
}
