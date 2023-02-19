
import 'package:flutter/widgets.dart';
import 'package:rental_car_app/Controllers/CategoryController.dart';
import 'package:rental_car_app/Controllers/VehicleController.dart';
import 'package:rental_car_app/Models/Vehicle.dart';
import 'package:rental_car_app/Repositories/category_repository.dart';
import 'package:rental_car_app/Repositories/vehicle_repository.dart';

import '../Models/Category.dart';

class VehicleProvider with ChangeNotifier{
  var _categoryController = CategoryController(CategoryRepository());
  var _vehicleController = VehicleController(VehicleRepository());

  List<Category> _categories = [];
  List<Vehicle> _anchor = [];
  List<Vehicle> _vehicles = [];
  List<Category> get categories => _categories;
  List<Vehicle> get vehicles => _vehicles;

  void fetchData() async{
    _categories = await _categoryController.getCategories();
    _anchor = await _vehicleController.getVehicles();
    _vehicles = _anchor;
    notifyListeners();
  }

  void filterCategory(int id)async{
    if(id == null){
      _vehicles = _anchor;
    }
    else{
      _vehicles = _anchor.where((element) => element.brand == id).toList();
    }
    notifyListeners();
    
  }
}