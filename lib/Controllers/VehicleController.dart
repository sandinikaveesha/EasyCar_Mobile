import 'package:rental_car_app/Models/Vehicle.dart';
import 'package:rental_car_app/Repositories/vehicle_service.dart';

class VehicleController{
  final VehicleService service;
  VehicleController(this.service);

  Future<List<Vehicle>> getVehicles()async{
    return await service.getVehicles();
  }

  
  Future<Vehicle> get(int vehicle) async{
    return await service.get(vehicle);
  }

}