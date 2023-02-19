import 'package:rental_car_app/Models/Booking.dart';
import 'package:rental_car_app/Repositories/booking_service.dart';

import '../Constants/constant.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BookingRepository implements BookingService{
  @override
  Future<String> add(Object data) async{
    var url = Uri.parse('$baseUrl/vehicle_booking/add_booking');
   
    var response = await http.post(url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(data));
        print(response.statusCode);
    if(response.statusCode == 200){
      if(response.body == "Vehicle Booked Successfully"){
        return "Success";
      }else{
        return "Vehicle is Already Booked";
      }
    }
    else{
      return "Error";
    }
    
  }

  @override
  Future<List<Booking>> getBookings(int user) async{
    List<Booking> list = [];
    var url = Uri.parse('$baseUrl/vehicle_booking/get-by-user');
    var response = await http.post(url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({"user":user}));
        print(response.statusCode);
    if(response.statusCode == 200){
      var body = json.decode(response.body);
      print(body);
      if(body.length>0){
        for (var booking in body){
          list.add(Booking.fromJson(booking));
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