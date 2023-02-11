import 'package:flutter/material.dart';
import 'package:rental_car_app/Constants/constant.dart';

class CustomTextbox extends StatelessWidget {
  CustomTextbox({
    Key? key,
    required this.hintText,
    this.controller
  }) : super(key: key);
  final String hintText;
  final TextEditingController? controller;
  

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: TextField(
              controller: controller,
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: normalText,
                  contentPadding: const EdgeInsets.only(left: 15, right: 15,bottom: 10),
                  border: InputBorder.none),
            ),
          ),
        ],
      ),
    );
  }
}
