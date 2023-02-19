import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rental_car_app/Constants/constant.dart';
import 'package:rental_car_app/Controllers/AgencyController.dart';
import 'package:rental_car_app/Models/Agency.dart';
import 'package:rental_car_app/Models/Vehicle.dart';
import 'package:rental_car_app/Repositories/agency_repository.dart';
import 'package:rental_car_app/Screens/Renting/car_details.dart';
import 'package:rental_car_app/Screens/booking_details_screen.dart';

import '../Controllers/ImageController.dart';
import '../Models/Image.dart';
import '../Repositories/image_repository.dart';
import '../Utils/utility_helper.dart';

class VehicleDetailsCard extends StatefulWidget {
  VehicleDetailsCard({Key? key, this.onTap, required this.vehicle}) : super(key: key);
  VoidCallback? onTap;
  Vehicle vehicle;

  @override
  State<VehicleDetailsCard> createState() => _VehicleDetailsCardState();
}

class _VehicleDetailsCardState extends State<VehicleDetailsCard> {
  // Dependency
  var _imgController = ImageController(ImageRepository());
  var _agencyController = AgencyController(AgencyRepository());

  // States
  List<VehicleImage> images = [];
  Agency agency = Agency();
  VehicleImage img = VehicleImage();

  _fethcInformations(Vehicle vehicle) async{
    List<VehicleImage> temp = [];
    Agency tempAgency = Agency();
    temp = await _imgController.getImages(int.parse(vehicle.id.toString()));
    
    tempAgency = await _agencyController.getAgency(int.parse(vehicle.agencyRef.toString()));
    setState(() {
      images = temp;
      agency = tempAgency;
      img = temp[0];
    });
  }

  @override
  void initState() {
    super.initState();
    _fethcInformations(widget.vehicle);
  }

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
              child: ClipRRect(
                clipBehavior: Clip.antiAlias,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
                child: Image.memory(Base64Decoder().convert(Utility.formatHelper(img.img.toString())),fit: BoxFit.cover,),
              ),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                // image: DecorationImage(
                //     image: NetworkImage(
                //         'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/2018-rolls-royce-phantom-1536152159.png'),
                //     fit: BoxFit.cover),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${widget.vehicle.model} | ${widget.vehicle.modelYear}",
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
                        "${agency.businessName}",
                        style: normalTextBold,
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Text(
                        "Rs ${widget.vehicle.pricePerDay}/day (Extra Km: ${widget.vehicle.extraCharge}) ",
                        style: normalTextBold,
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>CarDetails(images: images, agency: agency, vehicle: widget.vehicle,)));
                    },
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
