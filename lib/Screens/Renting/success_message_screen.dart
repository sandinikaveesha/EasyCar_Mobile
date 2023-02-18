import 'package:flutter/material.dart';
import 'package:rental_car_app/Constants/constant.dart';
import 'package:rental_car_app/Screens/home_screen.dart';

import '../../Components/button.dart';

class SuccessMessageScreen extends StatelessWidget {
  const SuccessMessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 22, 22, 22),
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          top: 30,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Image.asset('Assets/Images/success.png', width: 150, height: 150),
            ),
            const Text("Your rent is complete", style: subHeadingLight,),
            const SizedBox(height: 200,),
             Button(
                        buttonText: "Back to Home",
                        action: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomeScreen(),
                            ),
                          );
                        },
                      ),
          ],
        ),
      ),
    );
  }
}