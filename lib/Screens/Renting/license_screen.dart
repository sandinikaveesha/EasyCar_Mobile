import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../Components/button.dart';
import '../../Components/custom_back_button.dart';
import '../../Components/custom_textbox.dart';
import '../../Constants/constant.dart';
import '../../Utils/image_utility.dart';
import 'car_details.dart';

class LicenseScreen extends StatefulWidget {
  const LicenseScreen({super.key});

  @override
  State<LicenseScreen> createState() => _LicenseScreenState();
}

class _LicenseScreenState extends State<LicenseScreen> {
  final TextEditingController _licenseNumber = TextEditingController();
  final TextEditingController _expiryDate = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String imgString = sampleUpload;
    // Handle Image Picker
    _imagePicker() async {
      String output;
      ImagePicker().pickImage(source: ImageSource.gallery).then((img) async {
        output = ImageUtility.base64String(await img!.readAsBytes());
        print(output);
        setState(() {
          imgString = output;
        });
      });
    }
    
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
                    hintText: "First Name",
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
                        onTap: _imagePicker,
                        child: SizedBox(
                          height: 100,
                          width: 150,
                          child: ClipRRect(
                            clipBehavior: Clip.antiAlias,
                            borderRadius: BorderRadius.circular(10),
                            child: Image.memory(
                              Base64Decoder().convert(imgString),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: _imagePicker,
                        child: SizedBox(
                          height: 100,
                          width: 150,
                          child: ClipRRect(
                            clipBehavior: Clip.antiAlias,
                            borderRadius: BorderRadius.circular(10),
                            child: Image.memory(
                              Base64Decoder().convert(imgString),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50,),
                  Button(buttonText: "Next", action: (){}),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}