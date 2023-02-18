import 'package:flutter/material.dart';
import 'package:rental_car_app/Screens/home_screen.dart';

import '../Components/custom_back_button.dart';
import '../Constants/constant.dart';

class CompanyDetailsScreen extends StatelessWidget {
  const CompanyDetailsScreen({super.key});

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
          crossAxisAlignment: CrossAxisAlignment.start,
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
                        builder: (context) => const HomeScreen(),
                      ),
                    );
                  },
                ),
                const Text(
                  "Company Details",
                  style: mainHeadingLight,
                ),
              ],
            ),
            const SizedBox(height: 40,),
            const Text("Company Name", style: subHeadingLight,),
            const SizedBox(height: 10,),
            const Text("Company Address", style: subHeadingLight,),
            const SizedBox(height: 30,),
            Center(
              child: Container(
                width: 320,
                height: 320,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
