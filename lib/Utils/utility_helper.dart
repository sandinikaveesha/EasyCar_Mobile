import 'dart:convert';
import 'dart:typed_data';
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

  static Uint8List dataFromBase64String(String base64String) {
    return base64Decode(base64String);
  }

  static String base64String(Uint8List data) {
    return base64Encode(data);
  }

  static bool synchronize() {
    // todo: need to implement synchronization method
    return false;
  }

  static String convertorHelper(String base64) {
    String _stringImg = base64;
    int mod = _stringImg.length % 4;
    if (mod != 0) {
      int padding = 4 - mod;
      String paddingString = "".padRight(padding, '=');
      _stringImg += paddingString;
      return _stringImg;
    }
    return _stringImg;
  }

  static String formatHelper(String base64){
    return base64.replaceFirst('data:image/jpeg;base64,', '');
  }

 
}
