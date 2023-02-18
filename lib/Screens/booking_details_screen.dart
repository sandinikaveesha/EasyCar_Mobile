import 'package:flutter/material.dart';
import 'package:rental_car_app/Components/history_details.dart';

import '../Components/custom_back_button.dart';
import '../Components/pending_details.dart';
import '../Constants/constant.dart';
import 'home_screen.dart';

class BookingDetailsScreen extends StatelessWidget {
  const BookingDetailsScreen({super.key});

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
            const SizedBox(height: 30,),
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
                  "Booking Details",
                  style: mainHeadingLight,
                ),
              ],
            ),
            const SizedBox(height: 10,),
            // Expanded(
            //   child: Padding(
            //     padding: EdgeInsets.zero,
            //     child: ListView.builder(
            //       shrinkWrap: true,
            //       itemBuilder: ((context, index) {
            //         return Column(
            //           children: const [
            //             HistoryDetails(),
            //             SizedBox(
            //               height: 5,
            //             ),
            //           ],
            //         );
            //       }),
            //       itemCount: 10,
            //     ),
            //   ),
            // ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.zero,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: ((context, index) {
                    return Column(
                      children: const [
                       PendingDetails(),
                        SizedBox(
                          height: 5,
                        ),
                      ],
                    );
                  }),
                  itemCount: 10,
                ),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
