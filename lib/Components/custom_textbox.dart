import 'package:flutter/material.dart';
import 'package:rental_car_app/Constants/constant.dart';

class CustomTextbox extends StatelessWidget {
  CustomTextbox({
    Key? key,
    required this.hintText,
    this.controller,
    this.onTap,
  }) : super(key: key);
  final String hintText;
  final TextEditingController? controller;
  final VoidCallback? onTap;
  

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
          // color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.white, width: 1)
          ),     
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: TextField(
              onTap: onTap,
              controller: controller,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: normalTextLight,
                  contentPadding: const EdgeInsets.only(left: 15, right: 15,bottom: 5),
                  border: InputBorder.none),
            ),
          ),
        ],
      ),
    );
  }
}
