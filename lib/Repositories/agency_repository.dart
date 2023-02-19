import 'package:rental_car_app/Models/Agency.dart';
import 'package:rental_car_app/Repositories/agency_service.dart';

import '../Constants/constant.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AgencyRepository implements AgencyService{
  @override
  Future<Agency> getAgency(int id) async{
    Agency agency = Agency();
    var url = Uri.parse('$baseUrl/agency/get');
    var response = await http.post(url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({"id":id}));
    if(response.statusCode == 200){
      var body = json.decode(response.body);
      return agency = Agency.fromJson(body);
      
    }
    else{
      return agency;
    }

  }
  
}