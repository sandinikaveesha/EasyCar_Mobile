import 'package:flutter/material.dart';
import 'package:rental_car_app/Constants/constant.dart';
import 'package:rental_car_app/Screens/home_screen.dart';

class HistoryDetails extends StatelessWidget {
  const HistoryDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "BHV-2749",
                style: formTitleBold,
              ),
              const SizedBox(
                height: 3,
              ),
              Text(
                "Car",
                style: normalText,
              ),
              const SizedBox(
                height: 3,
              ),
              Text(
                "From - to date",
                style: normalText,
              ),
              const SizedBox(
                height: 3,
              ),
              Text(
                "Status",
                style: normalText,
              ),
            ],
          ),
          SizedBox(
            width: 100,
            height: 42,
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              },
              style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  backgroundColor: MaterialStateProperty.all(
                      const Color.fromARGB(255, 14, 93, 183)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)))),
              child: const Text(
                "Rate",
                style: formTitleBoldLight,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
