import 'package:rental_car_app/Constants/constant.dart';
import 'package:rental_car_app/Models/Customer.dart';
import 'package:rental_car_app/Repositories/customer_service.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CustomerRepository implements CustomerService{
  
  @override
  Future<String> register(Object data) async{
    print(data);

    var url = Uri.parse('$baseUrl/customer/register');
      var response = await http.post(url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(data));
      print(response.statusCode);
    return "true";
  }

  @override
  Future<Customer> login(String username, String password) async{
    var url = Uri.parse('$baseUrl/customer/login');
    var data = {"username": username, "password": password};
    var response = await http.post(url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(data));
        print(response.statusCode);
    if(response.statusCode == 200){
      
      var body = json.decode(response.body);
      return Customer.fromJson(body);
    }
    else{
      return Customer();
    }
  }
}