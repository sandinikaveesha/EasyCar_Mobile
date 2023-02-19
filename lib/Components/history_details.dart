import 'package:flutter/material.dart';
import 'package:rental_car_app/Constants/constant.dart';
import 'package:rental_car_app/Controllers/VehicleController.dart';
import 'package:rental_car_app/Models/Booking.dart';
import 'package:rental_car_app/Models/Vehicle.dart';
import 'package:rental_car_app/Repositories/vehicle_repository.dart';
import 'package:rental_car_app/Screens/home_screen.dart';
import 'package:intl/intl.dart';

class HistoryDetails extends StatefulWidget {
  const HistoryDetails({super.key, required this.booking});
  final Booking booking;

  @override
  State<HistoryDetails> createState() => _HistoryDetailsState();
}

class _HistoryDetailsState extends State<HistoryDetails> {
  Vehicle vehicle = Vehicle();
  var _vehicleController = VehicleController(VehicleRepository());

  _fetchVehicle(int vehicleId) async{
    Vehicle temp = await _vehicleController.get(vehicleId);
    setState(() {
      vehicle = temp;
    });
  }

  String _dateTimeFormat(String date){
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
              SizedBox(
                width: 100,
                height: 42,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomeScreen()),
                    );
                  },
                  style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      backgroundColor: MaterialStateProperty.all(
                          const Color.fromARGB(255, 14, 93, 183)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)))),
                  child: const Text(
                    "Rate",
                    style: formTitleBoldLight,
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
