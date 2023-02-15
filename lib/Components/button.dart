import 'package:flutter/material.dart';
import 'package:rental_car_app/Constants/constant.dart';

class Button extends StatelessWidget {
  const Button({Key? key, required this.buttonText, required this.action})
      : super(key: key);

  final String buttonText;
  final VoidCallback action;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 42,
      child: TextButton(
        onPressed: action,
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(Colors.white),
          backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 14, 93, 183)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25)
          ))
        ),
        child: Text(
          buttonText,
          style: normalTextBoldLight,
        ),
      ),
    );
  }
}
