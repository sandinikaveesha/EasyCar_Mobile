import 'package:rental_car_app/Models/Agency.dart';

abstract class AgencyService{

  Future<Agency> getAgency(int agency);
}