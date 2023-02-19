import 'package:rental_car_app/Models/Agency.dart';
import 'package:rental_car_app/Repositories/agency_service.dart';

class AgencyController{
  final AgencyService service;
  AgencyController(this.service);

  Future<Agency> getAgency(int agency) async{
    return await service.getAgency(agency);
  }
  
}