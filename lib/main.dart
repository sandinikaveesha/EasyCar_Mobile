import 'package:flutter/material.dart';
import 'package:rental_car_app/Screens/Renting/calender_screen.dart';
import 'package:rental_car_app/Screens/Renting/car_details.dart';
import 'package:rental_car_app/Screens/booking_details_screen.dart';
import 'package:rental_car_app/Screens/company_details_screen.dart';
import 'Screens/Onboarding/register_screen.dart';
import 'Screens/home_screen.dart';

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
      home: 
      // RegisterScreen()
      // CalenderScreen()
      // CarDetails()
      // HomeScreen(),
      // CompanyDetailsScreen()
      BookingDetailsScreen()
    );
  }
}

