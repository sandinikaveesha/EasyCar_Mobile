import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:rental_car_app/Components/button.dart';
import 'package:rental_car_app/Components/custom_back_button.dart';
import 'package:rental_car_app/Constants/constant.dart';

class CarDetails extends StatelessWidget {
  const CarDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> imageList = [
      'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/2018-rolls-royce-phantom-1536152159.png',
      'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/2634-genesisunveilsg90exteriorimages-1638281750.jpg',
      'https://cdn.luxe.digital/media/20220718163630/best-luxury-car-brands-bugatti-2022-luxe-digital.jpg'
    ];

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
            CustomBackButton(onTap: () {}),
            const SizedBox(
              height: 20,
            ),
            Column(
              children: [
                CarouselSlider(
                  items: imageList
                      .map((item) => Center(
                            child: Image.network(
                              item,
                              fit: BoxFit.cover,
                              width: 1000,
                            ),
                          ))
                      .toList(),
                  options: CarouselOptions(
                      autoPlay: true,
                      aspectRatio: 2.0,
                      enlargeCenterPage: true),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(bottom: 20),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Car Name",
                            style: subHeading,
                          ),
                          Text(
                            "Rs 3500/day",
                            style: normalTextBold,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Company name",
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
                      const SizedBox(
                        height: 3,
                      ),
                      Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "District",
                            style: normalTextBold,
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Car Details",
                          style: mainHeading,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Colour",
                            style: normalTextBold,
                          ),
                          Text(
                            "Blue",
                            style: normalText,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "License No",
                            style: normalTextBold,
                          ),
                          Text(
                            "SP-4568",
                            style: normalText,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Brand",
                            style: normalTextBold,
                          ),
                          Text(
                            "Toyota",
                            style: normalText,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Model",
                            style: normalTextBold,
                          ),
                          Text(
                            "Model",
                            style: normalText,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Model Year",
                            style: normalTextBold,
                          ),
                          Text(
                            "2011",
                            style: normalText,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Fuel Type",
                            style: normalTextBold,
                          ),
                          Text(
                            "Petrol",
                            style: normalText,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Engine Capacity",
                            style: normalTextBold,
                          ),
                          Text(
                            "150 cc",
                            style: normalText,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Gear Box",
                            style: normalTextBold,
                          ),
                          Text(
                            "Automatic",
                            style: normalText,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Button(
                        buttonText: "Rent",
                        action: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
