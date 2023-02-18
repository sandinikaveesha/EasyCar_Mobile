import 'package:flutter/material.dart';

class Utility {
   static ScaffoldFeatureController<SnackBar, SnackBarClosedReason> notification(
      String msg, BuildContext ctx, bool success) {
    return ScaffoldMessenger.of(ctx).showSnackBar(
      SnackBar(
        content: Text(msg),
        backgroundColor: (success ? Colors.greenAccent : Colors.redAccent),
        action: SnackBarAction(
          label: 'Dismiss',
          onPressed: () {},
        ),
      ),
    );
  }
}