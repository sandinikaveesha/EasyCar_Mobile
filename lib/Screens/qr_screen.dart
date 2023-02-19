import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:rental_car_app/Models/Booking.dart';

import '../Components/custom_back_button.dart';
import '../Constants/constant.dart';

class QrScreen extends StatelessWidget {
  const QrScreen({super.key, required this.booking});

  final Booking booking;

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
              const SizedBox(height: 30,),
              Row(
                children: [
                  CustomBackButton(
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  const Text(
                    "QR Code",
                    style: mainHeadingLight,
                  ),
                ],
              ),
              const SizedBox(height: 30,),
              Container(
                padding: const EdgeInsets.all(10),
                width: 400,
                height: 350,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                
                child: QrImage(data: '${booking.id}',
                version: QrVersions.auto,
                size: 390,),
              ),
            ],
          ),
      ),
    );
  }
}