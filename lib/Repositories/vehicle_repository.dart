import 'package:rental_car_app/Models/Vehicle.dart';
import 'package:rental_car_app/Repositories/vehicle_service.dart';

import '../Constants/constant.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class VehicleRepository implements VehicleService{
  @override
  Future<List<Vehicle>> getVehicles() async{
    List<Vehicle> list = [];
    var url = Uri.parse('$baseUrl/vehicle/get_all_vehicles');
    var response = await http.get(url,
        headers: {'Content-Type': 'application/json'});
    if(response.statusCode == 200){
      var body = json.decode(response.body);
      if(body.length>0){
        for (var vehicle in body){
          list.add(Vehicle.fromJson(vehicle));
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
  
  @override
  Future<Vehicle> get(int id) async{
    Vehicle vehicle = Vehicle();
    var url = Uri.parse('$baseUrl/vehicle/get');
    var response = await http.post(url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({"vehicle": id}));
        print(response.statusCode);
    if(response.statusCode == 200){
      print(response.body);
      return vehicle = Vehicle.fromJson(json.decode(response.body));
    }
    else{
      return vehicle;
    }
   
  }
}