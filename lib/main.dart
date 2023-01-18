import 'package:flutter/material.dart';
import './onboarding/register_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: const Color(0xff2687A4),
        primaryColorDark: const Color.fromARGB(255, 21, 90, 111),
      ),
      home: const RegisterScreen(),
    );
  }
}

