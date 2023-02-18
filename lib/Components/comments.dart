import 'package:flutter/material.dart';
import 'package:rental_car_app/Constants/constant.dart';

class Comments extends StatelessWidget {
  const Comments({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                width: 50,
                height: 50,
                child: CircleAvatar(
                  radius: 30,
                ),
              ),
              const SizedBox(width: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Customer Name",
                    style: subHeading,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Comment",
                    style: normalText,
                  ),
                ],
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "4.5",
                    style: normalText,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Icon(
                    Icons.star,
                    color: Color(0xffFFAE00),
                    size: 18,
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
