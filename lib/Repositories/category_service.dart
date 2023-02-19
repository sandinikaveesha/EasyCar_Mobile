import 'package:rental_car_app/Models/Category.dart';

abstract class CategoryService{
  Future<List<Category>> getCategories();
}