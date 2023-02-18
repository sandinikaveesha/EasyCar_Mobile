import 'package:flutter/material.dart';

import '../Constants/constant.dart';

class PendingDetails extends StatelessWidget {
  const PendingDetails({super.key});

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
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(10),
            ),
            // child: Image(image: ),
          ),
        ],
      ),
    );
  }
}