import 'package:rental_car_app/Models/Category.dart';
import 'package:rental_car_app/Repositories/category_service.dart';

class CategoryController{
  final CategoryService service;
  CategoryController(this.service);
  
  Future<List<Category>> getCategories()async{
    return await service.getCategories();
  }
  
}