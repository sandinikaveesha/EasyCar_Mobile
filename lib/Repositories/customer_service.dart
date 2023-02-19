import '../Models/Customer.dart';

abstract class CustomerService{
  Future<String> register(Object data);
  Future<Customer> login(String username, String password);
}