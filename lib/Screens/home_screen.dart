import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:rental_car_app/Components/vehicle_details_card.dart';
import 'package:rental_car_app/Constants/constant.dart';
import 'package:rental_car_app/Screens/filter_screen.dart';

import '../Components/custom_bottom_navigation_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
          children: [
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Select Your Car",
                  style: mainHeadingLight,
                ),
                Icon(
                  Icons.notifications,
                  color: Colors.white,
                  size: 24,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 45,
                  width: 300,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(99, 133, 132, 132),
                      borderRadius: BorderRadius.circular(30)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      const SizedBox(
                        width: 30,
                        height: 30,
                        child: Icon(
                          Icons.search,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          onChanged: (value) => null,
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                              hintText: 'Search for Location',
                              hintStyle: normalTextLight,
                              contentPadding:
                                  EdgeInsets.only(left: 15, right: 15, bottom: 5),
                              border: InputBorder.none),
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const FilterScreen()));
                  },
                  child: const Icon(Icons.sort_sharp, color: Colors.white, size: 24,)),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            // Column(
            //   children: [
            //     CarouselSlider(
            //       items: imageList
            //           .map((item) => Center(
            //                 child: Image.network(
            //                   item,
            //                   fit: BoxFit.cover,
            //                   width: 1000,
            //                 ),
            //               ))
            //           .toList(),
            //       options: CarouselOptions(
            //           autoPlay: true,
            //           aspectRatio: 2.0,
            //           enlargeCenterPage: true),
            //     ),
            //   ],
            // ),
            // const SizedBox(
            //   height: 20,
            // ),
            
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Popular Cars",
                style: subHeadingLight,
              ),
            ),
            Expanded(child: ListView.builder(itemBuilder: (context, index) => VehicleDetailsCard(), itemCount: 5,))
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(index: 0,),
    );
  }
}
