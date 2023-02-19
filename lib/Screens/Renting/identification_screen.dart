import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rental_car_app/Components/button.dart';
import 'package:rental_car_app/Components/custom_textbox.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rental_car_app/Models/Agency.dart';
import 'package:rental_car_app/Models/Image.dart';
import 'package:rental_car_app/Models/Vehicle.dart';
import 'package:rental_car_app/Screens/Renting/license_screen.dart';
import 'package:rental_car_app/Utils/utility_helper.dart';
import '../../Components/custom_back_button.dart';
import '../../Constants/constant.dart';
import '../../Utils/image_utility.dart';
import 'car_details.dart';

class IdentificationScreen extends StatefulWidget {
  IdentificationScreen({super.key, required this.images,required this.vehicle, required this.startDate, required this.endDate, required this.agency});

  Vehicle vehicle;
  String startDate;
  String endDate;
  Agency agency;
  List<VehicleImage> images;

  @override
  State<IdentificationScreen> createState() => _IdentificationScreenState();
}

class _IdentificationScreenState extends State<IdentificationScreen> {
  String valueChoose='Select Identification Type';
  List listItems = ['Select Identification Type','National ID', 'Passport'];
  final TextEditingController _idNumber = TextEditingController();
  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  String nicFront = sampleUpload;
  String nicBack = sampleUpload;

   // Handle Image Picker
    _imagePicker(path) async {
      String output;
      ImagePicker().pickImage(source: ImageSource.gallery).then((img) async {
        output = Utility.base64String(await img!.readAsBytes());
        print(output);
        if(path == 'nicFront'){
          setState(() {
            nicFront = output;
          });
        }
        else{
          setState(() {
            nicBack = output;
          });
        }
        
      });
    }

  @override
  Widget build(BuildContext context) {
    
  
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: true,
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
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                      child: DropdownButton<String>(
                          value: valueChoose,
                          dropdownColor: Colors.black,
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
                            return DropdownMenuItem<String>(
                              value: valueItem,
                              child: Text(valueItem, style: normalTextLight,),
                            );
                          }).toList(),
                          onChanged: (String? value) {
                            print(value);
                            setState(() {
                              valueChoose = value!;
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
                      height: 30,
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
                          onTap: ()=>_imagePicker('nicFront'),
                          child: SizedBox(
                            height: 100,
                            width: 150,
                            child: ClipRRect(
                              clipBehavior: Clip.antiAlias,
                              borderRadius: BorderRadius.circular(10),
                              child: Image.memory(
                                Base64Decoder().convert(nicFront),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: ()=>_imagePicker('nicBack'),
                          child: SizedBox(
                            height: 100,
                            width: 150,
                            child: ClipRRect(
                              clipBehavior: Clip.antiAlias,
                              borderRadius: BorderRadius.circular(10),
                              child: Image.memory(
                                Base64Decoder().convert(nicBack),
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
                          if(valueChoose == "Select Identification Type" || _idNumber.text == null || _idNumber.text == "" || _firstName.text == null || _firstName.text == "" || _lastName.text == null || _lastName.text == "") return;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LicenseScreen(vehicle: widget.vehicle, startDate: widget.startDate, endDate: widget.endDate, idType: valueChoose, id: _idNumber.text, firstName: _firstName.text, lastName: _lastName.text, agency: widget.agency,images: widget.images,),
                            ),
                          );
                        }),
                  ],
                ),
                ]
              ),
            ),
          ],
        ),
      ),
    );
  }
}
