import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 30,
      height: 30,
      child: GestureDetector(
        onTap: onTap,
        child: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 24,)),
    );
  }
}