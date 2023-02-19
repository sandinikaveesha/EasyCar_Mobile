import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rental_car_app/Controllers/BookingController.dart';
import 'package:rental_car_app/Models/Customer.dart';
import 'package:rental_car_app/Models/Image.dart';
import 'package:rental_car_app/Repositories/booking_repository.dart';
import 'package:rental_car_app/Utils/utility_helper.dart';

import '../../Components/button.dart';
import '../../Components/custom_back_button.dart';
import '../../Constants/constant.dart';
import '../../Models/Agency.dart';
import '../../Models/Vehicle.dart';
import '../../Provider/user_provider.dart';
import 'car_details.dart';
import 'success_message_screen.dart';
import 'package:intl/intl.dart';


class PaymentConfirmationScreen extends StatefulWidget {
  const PaymentConfirmationScreen({super.key, required this.vehicle, required this.startDate, required this.endDate, required this.idType, required this.id, required this.firstName, required this.lastName, required this.agency, required this.licenseNumber, required this.expireDate, required this.images});

  final Vehicle vehicle;
  final String startDate;
  final String endDate;
  final String idType;
  final String id;
  final String firstName;
  final String lastName;
  final Agency agency;
  final String licenseNumber;
  final String expireDate;
  final List<VehicleImage> images;

  @override
  State<PaymentConfirmationScreen> createState() => _PaymentConfirmationScreenState();
}

class _PaymentConfirmationScreenState extends State<PaymentConfirmationScreen> {

  var _bookingController = BookingController(BookingRepository());

  int days = 0;
  double sum = 0;
  
  String _dateTimeFormat(String date){
    DateTime dateTime = DateTime.parse(date);
    String formattedDate = DateFormat('d MMM').format(dateTime);
    return formattedDate;
  }

  _cal(rate, stratDate, endDate){

    DateTime from = DateTime.parse(widget.startDate);
    DateTime to = DateTime.parse(endDate);
    int dayCount  = to.difference(from).inDays;
    double total = dayCount * double.parse(rate.toString());

    setState(() {
      days = dayCount;
      sum  = total;
    });

  }

  _handleSave(Customer user, BuildContext ctx) async{
    print(user.toJson());
    var data = {
      "start_date": widget.startDate,
      "end_date": widget.endDate,
      "agency_ref": widget.agency.id,
      "vehicle_ref": widget.vehicle.id,
      "user": user.id,
      "amount": sum,
      "now": DateTime.now().toLocal().toString(),
      "exp": widget.expireDate,
      "license": widget.licenseNumber,
      "firstName": widget.firstName,
      "lastName": widget.lastName,
      "type": widget.idType,
      "nic": widget.id
    };
    print(data);

    var response = await _bookingController.add(data);
    if(response == "Vehicle is Already Booked"){
      Utility.notification("Vehicle is Already Booked", ctx, false);
    }else{
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SuccessMessageScreen(),
                            ),
                          );
    }

                          
  }

  @override
  void initState() {
    super.initState();
    _cal(widget.vehicle.pricePerDay, widget.startDate, widget.endDate);
  }

  @override
  Widget build(BuildContext context) {
    Customer user = Provider.of<User>(context, listen: false).user;
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
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => const CarDetails()));
                  },
                ),
                const Text(
                  "Payment Confirmation",
                  style: mainHeadingLight,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 100,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    clipBehavior: Clip.antiAlias,child: Image.memory(Base64Decoder().convert(Utility.formatHelper(widget.images[0].img.toString())),fit: BoxFit.cover,),),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${widget.vehicle.registrationNo}",
                      style: normalTextLight,
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      "${widget.agency.businessName}",
                      style: normalTextLight,
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      "${widget.agency.address}",
                      style: normalTextLight,
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children:[
                        const Text(
                          "Rs. ",
                          style: normalTextLight,
                        ),
                        Text(
                          "${widget.vehicle.pricePerDay}",
                          style: normalTextLight,
                        ),
                        const Text(
                          "/day",
                          style: normalTextLight,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            const Text(
              "Rent Duration",
              style: formTitleBoldLight,
            ),
            const SizedBox(
              height: 5,
            ),
            Text("${_dateTimeFormat(widget.startDate)} - ${_dateTimeFormat(widget.endDate)}", style: normalTextLight,),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Payment Details",
              style: formTitleBoldLight,
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Rs. ${widget.vehicle.pricePerDay} * ${days} ", style: normalTextLight,),
                Text("Rs.${sum}", style: normalTextLight,),
              ],
            ),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Total Cost", style: normalTextBoldLight,),
                Text("Rs.${sum}", style: normalTextBoldLight,),
              ],
            ),
            const SizedBox(height: 30,),
            Button(
                        buttonText: "Confirm & Pay",
                        action: () {
                          _handleSave(user, context);
                        },
                      ),
          ],
        ),
      ),
    );
  }
}
