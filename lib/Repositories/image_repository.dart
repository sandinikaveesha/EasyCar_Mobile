import 'package:rental_car_app/Models/Image.dart';
import 'package:rental_car_app/Repositories/image_service.dart';

import '../Constants/constant.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ImageRepository implements ImageService{
  @override
  Future<List<VehicleImage>> getImages(int vehicle) async{
    List<VehicleImage> list = [];
    var url = Uri.parse('$baseUrl/image/get');
    var response = await http.post(url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({"vehicle":vehicle}));
    if(response.statusCode == 200){
      var body = json.decode(response.body);
      if(body.length>0){
        for (var img in body){
          list.add(VehicleImage.fromJson(img));
        }
        return list;
      }
      else{
        return list;
      }
    }
    else{
      return list;
    }

  }
  
}