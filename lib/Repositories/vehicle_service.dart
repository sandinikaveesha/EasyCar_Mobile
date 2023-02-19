import 'package:rental_car_app/Models/Vehicle.dart';

abstract class VehicleService{
  Future<List<Vehicle>> getVehicles();

  Future<Vehicle> get(int vehicle);
}