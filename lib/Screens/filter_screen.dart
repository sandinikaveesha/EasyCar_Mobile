import 'package:flutter/material.dart';
import 'package:rental_car_app/Constants/constant.dart';
import 'package:rental_car_app/Screens/home_screen.dart';

import '../Components/custom_back_button.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: const Color.fromARGB(255, 22, 22, 22),
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          top: 30,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                CustomBackButton(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen()));
                  },
                ),
                const Text("Filter", style: mainHeadingLight,),
                const Spacer(),
                GestureDetector(
                  onTap: () {}, // have to clear all the text boxes
                  child: const Text("Reset", style: subHeadingLight,))
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            
          ],
        ),
      ),
    );
  }
}
