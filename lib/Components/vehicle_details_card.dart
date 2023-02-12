import 'package:flutter/material.dart';
import 'package:rental_car_app/Constants/constant.dart';

class VehicleDetailsCard extends StatelessWidget {
  VehicleDetailsCard({Key? key, this.onTap}) : super(key: key);
  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Container(
              height: 130,
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                image: DecorationImage(
                    image: NetworkImage(
                        'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/2018-rolls-royce-phantom-1536152159.png'),
                    fit: BoxFit.cover),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Rolls Royce Phantom",
                    style: normalTextBold,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        size: 20,
                        color: Color.fromARGB(255, 234, 211, 3),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        "4.5",
                        style: normalTextBold,
                      )
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, bottom: 3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "ABC Company",
                        style: normalTextBold,
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Text(
                        "Rs 3500/day (150km) ",
                        style: normalTextBold,
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: onTap,
                    child: Container(
                      width: 100,
                      height: 40,
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 14, 93, 183),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: const Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Rent",
                          style: normalTextBoldLight,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 3,)
          ],
        ),
      ),
    );
  }
}
