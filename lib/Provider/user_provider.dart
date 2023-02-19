import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rental_car_app/Models/Customer.dart';
import 'package:rental_car_app/Provider/booking_provider.dart';
import 'package:rental_car_app/Provider/vehicle_provider.dart';
import 'package:rental_car_app/Screens/home_screen.dart';
import 'package:provider/provider.dart';
import '../Controllers/CustomerController.dart';
import '../Repositories/customer_repository.dart';
import '../Utils/utility_helper.dart';

class User with ChangeNotifier{
  var _customerController = CustomerController(CustomerRepository());
  // States
  Customer _user = Customer();
  Customer get user => _user;

  void login(String username, String password, BuildContext context)async{
    context.read<VehicleProvider>().fetchData();
    Customer customer = await _customerController.login(username, password);
    if (customer.id == 0) {
        Utility.notification(
            "Password and Email Did not Matched!", context, false);

    }else{
       _user = customer;
       context.read<BookingProvider>().fetchBookings(int.parse(customer.id.toString()));
       Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
    }
    notifyListeners();
  }
}