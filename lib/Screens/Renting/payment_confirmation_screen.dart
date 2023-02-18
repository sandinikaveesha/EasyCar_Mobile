import 'package:flutter/material.dart';

import '../../Components/button.dart';
import '../../Components/custom_back_button.dart';
import '../../Constants/constant.dart';
import 'car_details.dart';
import 'success_message_screen.dart';

class PaymentConfirmationScreen extends StatelessWidget {
  const PaymentConfirmationScreen({super.key});

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
                            builder: (context) => const CarDetails()));
                  },
                ),
                const Text(
                  "Payment Confirmation",
                  style: mainHeadingLight,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 100,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                        image: NetworkImage(
                            'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/2018-rolls-royce-phantom-1536152159.png'),
                        fit: BoxFit.cover),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Car Name",
                      style: normalTextLight,
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    const Text(
                      "Company Name",
                      style: normalTextLight,
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    const Text(
                      "District",
                      style: normalTextLight,
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text(
                          "Rs. ",
                          style: normalTextLight,
                        ),
                        Text(
                          "3500",
                          style: normalTextLight,
                        ),
                        Text(
                          "/day",
                          style: normalTextLight,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            const Text(
              "Rent Duration",
              style: formTitleBoldLight,
            ),
            const SizedBox(
              height: 5,
            ),
            const Text("11 Sept - 15 Sept", style: normalTextLight,),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Payment Details",
              style: formTitleBoldLight,
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Rs. 3500 * 5 ", style: normalTextLight,),
                Text("Rs.16500", style: normalTextLight,),
              ],
            ),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Total Cost", style: normalTextBoldLight,),
                Text("Rs.16500", style: normalTextBoldLight,),
              ],
            ),
            const SizedBox(height: 30,),
            Button(
                        buttonText: "Confirm & Pay",
                        action: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SuccessMessageScreen(),
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
