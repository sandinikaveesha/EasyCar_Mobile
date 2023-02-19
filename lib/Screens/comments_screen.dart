import 'package:flutter/material.dart';
import 'package:rental_car_app/Components/comments.dart';
import 'package:rental_car_app/Screens/Renting/car_details.dart';

import '../Components/custom_back_button.dart';
import '../Constants/constant.dart';

class CommentsScreen extends StatelessWidget {
  const CommentsScreen({super.key});

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
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => const CarDetails(),
                    //   ),
                    // );
                  },
                ),
                const Text(
                  "All Comments",
                  style: mainHeadingLight,
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: ((context, index) {
                  return Column(
                    children: const [
                      Comments(),
                      SizedBox(
                        height: 5,
                      ),
                    ],
                  );
                }),
                itemCount: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
