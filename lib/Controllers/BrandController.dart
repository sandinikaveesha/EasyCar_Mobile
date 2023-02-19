import 'package:rental_car_app/Models/Brand.dart';
import 'package:rental_car_app/Repositories/brand_service.dart';

class BrandController{
  final BrandService service;
  BrandController(this.service);

  Future<Brand> getBrand(int brand){
    return service.getBrand(brand);
  }
}