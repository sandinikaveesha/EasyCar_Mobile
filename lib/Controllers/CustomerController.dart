import 'package:rental_car_app/Models/Customer.dart';
import 'package:rental_car_app/Repositories/customer_repository.dart';
import 'package:rental_car_app/Repositories/customer_service.dart';



class CustomerController{
  final CustomerService service;
  CustomerController(this.service);

  bool register(Object data){
    service.register(data);
    return true;
  }

  Future<Customer> login(String username, String password) async{
    return await service.login(username, password);
  }
  
}