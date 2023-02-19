import 'package:flutter/material.dart';
import 'package:rental_car_app/Components/button.dart';
import 'package:rental_car_app/Constants/constant.dart';
import 'package:rental_car_app/Models/Image.dart';
import 'package:rental_car_app/Screens/Renting/car_details.dart';
import 'package:rental_car_app/Screens/Renting/identification_screen.dart';
import 'package:rental_car_app/Utils/utility_helper.dart';

import '../../Components/custom_back_button.dart';
import '../../Models/Agency.dart';
import '../../Models/Vehicle.dart';

class CalenderScreen extends StatelessWidget {
  CalenderScreen({super.key, required this.vehicle, required this.agency, required this.images});

  Vehicle vehicle;
  Agency agency;
  List<VehicleImage> images;

  @override
  Widget build(BuildContext context) {
    TextEditingController _bookingDateController = TextEditingController();
    TextEditingController _returnDateController = TextEditingController();
    return Scaffold(
      body: Container(
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
              children: [
                CustomBackButton(
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                const Text("Select Date", style: mainHeadingLight,),
              ],
            ),
            const SizedBox(height: 40,),
            TextFormField(
              readOnly: true,
              controller: _bookingDateController,
              style: normalTextLight,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 5),
                hintStyle: normalTextLight,
                hintText: 'Select booking date and time',
                prefixIcon: const Icon(Icons.calendar_today),
                prefixIconColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(10)
                )
              ),
              onTap: () async{
                  final DateTime? selectedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2020),
                  lastDate: DateTime(2025),
                );
                if(selectedDate != null){
                   final TimeOfDay? selectedTime = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                  if (selectedTime != null) {
                    final DateTime selectedDateTime = DateTime(
                      selectedDate.year,
                      selectedDate.month,
                      selectedDate.day,
                      selectedTime.hour,
                      selectedTime.minute,
                      
                    );
                    _bookingDateController.text = selectedDateTime.toString();
                    }
                }
              },
            ),
            const SizedBox(height: 20,),
            TextFormField(
              readOnly: true,
              controller: _returnDateController,
              style: normalTextLight,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 5),
                hintStyle: normalTextLight,      
                hintText: 'Select return date and time',
                fillColor: Colors.white,
                prefixIcon: const Icon(Icons.calendar_today),
                prefixIconColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(10)
                )
              ),
              onTap: () async{
                  final DateTime? selectedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2020),
                  lastDate: DateTime(2025),
                );
                if(selectedDate != null){
                   final TimeOfDay? selectedTime = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                  if (selectedTime != null) {
                    final DateTime selectedDateTime = DateTime(
                      selectedDate.year,
                      selectedDate.month,
                      selectedDate.day,
                      selectedTime.hour,
                      selectedTime.minute,
                      
                    );
                     _returnDateController.text = selectedDateTime.toString();
                    }
                }
              },
            ),
            const SizedBox(
              height: 50,
            ),
            Button(buttonText: "Next", action: (){
              if(_bookingDateController.text == null || _bookingDateController.text == "" || _returnDateController.text == null || _returnDateController.text == "") return;
              print(_returnDateController.text);
              Navigator.push(context, MaterialPageRoute(builder: (context)=> IdentificationScreen(vehicle: vehicle, startDate: _bookingDateController.text, endDate: _returnDateController.text, agency: agency,images: images,)));})
          ],
        ),
      ),
    );
  }
  _handleNext(){}
}
