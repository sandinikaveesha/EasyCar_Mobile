import 'package:rental_car_app/Models/Brand.dart';

abstract class BrandService{

  Future<Brand> getBrand(int id);
}