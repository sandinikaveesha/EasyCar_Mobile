import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rental_car_app/Models/Agency.dart';
import 'package:rental_car_app/Models/Image.dart';
import 'package:rental_car_app/Models/Vehicle.dart';
import 'package:rental_car_app/Screens/Renting/payment_confirmation_screen.dart';

import '../../Components/button.dart';
import '../../Components/custom_back_button.dart';
import '../../Components/custom_textbox.dart';
import '../../Constants/constant.dart';
import '../../Utils/image_utility.dart';
import 'car_details.dart';

class LicenseScreen extends StatefulWidget {
  const LicenseScreen({super.key, required this.images,required this.vehicle, required this.startDate, required this.endDate, required this.idType, required this.id, required this.firstName, required this.lastName, required this.agency});

  final Vehicle vehicle;
  final String startDate;
  final String endDate;
  final String idType;
  final String id;
  final String firstName;
  final String lastName;
  final Agency agency;
  final List<VehicleImage> images;

  @override
  State<LicenseScreen> createState() => _LicenseScreenState();
}

class _LicenseScreenState extends State<LicenseScreen> {
  final TextEditingController _licenseNumber = TextEditingController();
  final TextEditingController _expiryDate = TextEditingController();

  String imgFront = sampleUpload;
  String imgBack = sampleUpload;
    // Handle Image Picker
    _imagePicker(path) async {
      String output;
      ImagePicker().pickImage(source: ImageSource.gallery).then((img) async {
        output = ImageUtility.base64String(await img!.readAsBytes());
        print(output);
        if(path == 'front'){
        setState(() {
          imgFront = output;
        });
        }
        else{
          setState(() {
            imgBack = output;
          });
        }
        
      });
    }

   

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
                    Navigator.pop(context);
                  },
                ),
                const Text(
                  "Handover Person",
                  style: mainHeadingLight,
                ),
              ],
            ),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Driving License",
                    style: subHeadingLight,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextbox(
                    hintText: "License Number",
                    controller: _licenseNumber,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextbox(
                    hintText: "License Expire Date",
                    controller: _expiryDate,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    "Upload Driving License Photos",
                    style: subHeadingLight,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: ()=>_imagePicker('front'),
                        child: SizedBox(
                          height: 100,
                          width: 150,
                          child: ClipRRect(
                            clipBehavior: Clip.antiAlias,
                            borderRadius: BorderRadius.circular(10),
                            child: Image.memory(
                              const Base64Decoder().convert(imgFront),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: ()=>_imagePicker('back'),
                        child: SizedBox(
                          height: 100,
                          width: 150,
                          child: ClipRRect(
                            clipBehavior: Clip.antiAlias,
                            borderRadius: BorderRadius.circular(10),
                            child: Image.memory(
                              const Base64Decoder().convert(imgBack),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Button(
                      buttonText: "Next",
                      action: () {
                        if(_licenseNumber.text == null || _licenseNumber.text == "" || _expiryDate.text == null || _expiryDate.text == "") return;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                PaymentConfirmationScreen(vehicle: widget.vehicle, startDate: widget.startDate, endDate: widget.endDate,idType: widget.idType,id: widget.id,firstName: widget.firstName, lastName: widget.lastName, agency: widget.agency,licenseNumber: _licenseNumber.text, expireDate: _expiryDate.text, images: widget.images,),
                          ),
                        );
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
