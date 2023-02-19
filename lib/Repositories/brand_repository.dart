import 'package:rental_car_app/Models/Brand.dart';
import 'package:rental_car_app/Repositories/brand_service.dart';

import '../Constants/constant.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BrandRepository implements BrandService{
  @override
  Future<Brand> getBrand(int id) async{
    Brand brand = Brand();
    var url = Uri.parse('$baseUrl/brand/get');
    var response = await http.post(url, headers: {'Content-Type': 'application/json'}, body: json.encode({"brand":id}));
    print(response.statusCode);
    if(response.statusCode == 200){
      var body = json.decode(response.body);
      brand = Brand.fromJson(body);
      return brand;
    }
    else{
      return brand;
    }
  }
}