import 'package:flutter/material.dart';
import 'package:rental_car_app/Screens/Renting/car_details.dart';
import 'Screens/Onboarding/register_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: CarDetails(),
    );
  }
}

