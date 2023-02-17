import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rental_car_app/Components/button.dart';
import 'package:rental_car_app/Components/custom_textbox.dart';
import 'package:image_picker/image_picker.dart';
import '../../Components/custom_back_button.dart';
import '../../Constants/constant.dart';
import '../../Utils/image_utility.dart';
import 'car_details.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  late String valueChoose;
  List listItems = ['National ID', 'Passport'];
  final TextEditingController _idNumber = TextEditingController();
  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();

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
                    "Identification",
                    style: subHeadingLight,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: DropdownButton(
                        dropdownColor: Colors.white,
                        hint: const Text(
                          "Select Identification Type",
                          style: normalTextLight,
                        ),
                        icon: const Icon(
                          Icons.arrow_drop_down,
                          color: Colors.white,
                        ),
                        iconSize: 24,
                        underline: const SizedBox(),
                        items: listItems.map((valueItem) {
                          return DropdownMenuItem(
                            value: valueItem,
                            child: Text(valueItem),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            valueChoose != newValue;
                          });
                        }),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomTextbox(
                    hintText: "Identification Number",
                    controller: _idNumber,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextbox(
                    hintText: "First Name",
                    controller: _firstName,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextbox(
                    hintText: "Last Name",
                    controller: _lastName,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Upload Identification Photos",
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
