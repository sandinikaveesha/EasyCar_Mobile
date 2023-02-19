import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:rental_car_app/Components/button.dart';
import 'package:rental_car_app/Components/custom_back_button.dart';
import 'package:rental_car_app/Constants/constant.dart';
import 'package:rental_car_app/Controllers/BrandController.dart';
import 'package:rental_car_app/Models/Agency.dart';
import 'package:rental_car_app/Models/Brand.dart';
import 'package:rental_car_app/Models/Image.dart';
import 'package:rental_car_app/Models/Vehicle.dart';
import 'package:rental_car_app/Repositories/brand_repository.dart';
import 'package:rental_car_app/Screens/Renting/calender_screen.dart';
import 'package:rental_car_app/Screens/comments_screen.dart';
import 'package:rental_car_app/Screens/company_details_screen.dart';
import 'package:rental_car_app/Screens/home_screen.dart';
import 'package:rental_car_app/Utils/utility_helper.dart';

class CarDetails extends StatefulWidget {
  CarDetails({super.key, required this.images, required this.agency, required this.vehicle});

  List<VehicleImage> images;
  Agency agency;
  Vehicle vehicle;

  @override
  State<CarDetails> createState() => _CarDetailsState();
}

class _CarDetailsState extends State<CarDetails> {
  String brandTitle = "";
  var _brandController = BrandController(BrandRepository());

    _fetchBrand(Vehicle vehicle) async{
      print("test");
      Brand temp = await _brandController.getBrand(int.parse(vehicle.brand.toString()));
      print(temp.toJson());
      setState(() {
        brandTitle = temp.title.toString();
      });
    }


      @override
      void initState() {
        super.initState();
        _fetchBrand(widget.vehicle); 
      }
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
            CustomBackButton(onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                ),
              );
            }),
            const SizedBox(
              height: 20,
            ),
            Column(
              children: [
                CarouselSlider(
                  items: widget.images
                      .map((item) => Center(
                            child: Image.memory(
                              Base64Decoder().convert(Utility.formatHelper(item.img.toString(),)),
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
                            "${widget.vehicle.registrationNo}",
                            style: subHeading,
                          ),
                          Text(
                            "Rs ${widget.vehicle.pricePerDay}/day",
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
                            "${widget.agency.businessName}",
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
                            "${widget.agency.address}",
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
                            "${widget.vehicle.color}",
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
                            "${widget.vehicle.registrationNo}",
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
                            "${brandTitle}",
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
                            "${widget.vehicle.model}",
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
                            "${widget.vehicle.modelYear}",
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
                            "${widget.vehicle.fuelType}",
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
                            "${widget.vehicle.engineCapacity} cc",
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
                            "Gear Type",
                            style: normalTextBold,
                          ),
                          Text(
                            "${widget.vehicle.gear}",
                            style: normalText,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CommentsScreen(),
                            ),
                          );
                        },
                        child: Text(
                          "See Comments",
                          style: normalTextBold,
                        ),
                      ),
                      const SizedBox(height: 10,),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CompanyDetailsScreen(agency: widget.agency,),
                            ),
                          );
                        },
                        child: Text(
                          "See Agency Details",
                          style: normalTextBold,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Button(
                        buttonText: "Rent",
                        action: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CalenderScreen( vehicle: widget.vehicle, agency: widget.agency,images: widget.images,),
                            ),
                          );
                        },
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
