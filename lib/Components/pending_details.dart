import 'package:flutter/material.dart';
import 'package:rental_car_app/Models/Booking.dart';
import 'package:intl/intl.dart';
import 'package:rental_car_app/Screens/qr_screen.dart';

import '../Constants/constant.dart';
import '../Controllers/VehicleController.dart';
import '../Models/Vehicle.dart';
import '../Repositories/vehicle_repository.dart';

class PendingDetails extends StatefulWidget {
  const PendingDetails({super.key, required this.booking});
  final Booking booking;

  @override
  State<PendingDetails> createState() => _PendingDetailsState();
}

class _PendingDetailsState extends State<PendingDetails> {
 Vehicle vehicle = Vehicle();
  var _vehicleController = VehicleController(VehicleRepository());

   _fetchVehicle(int vehicleId) async{
    Vehicle temp = await _vehicleController.get(vehicleId);
    setState(() {
      vehicle = temp;
    });
  }

  String _dateTimeFormat(String date) {
    DateTime dateTime = DateTime.parse(date);
    String formattedDate = DateFormat('d MMM yyyy').format(dateTime);
    return formattedDate;
  }

  @override
  void initState() {
    super.initState();
     _fetchVehicle(int.parse(widget.booking.vehicleRef.toString()));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10,),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${vehicle.registrationNo}",
                    style: formTitleBold,
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    "${vehicle.model}",
                    style: normalText,
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    "${_dateTimeFormat(widget.booking.startDate.toString())} - ${_dateTimeFormat(widget.booking.endDate.toString())}",
                    style: normalText,
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    "${widget.booking.status}",
                    style: normalText,
                  ),
                ],
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QrScreen(booking: widget.booking,),
                    ),
                  );
                },
                child: Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.qr_code,
                    color: Colors.black,
                    size: 50,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
