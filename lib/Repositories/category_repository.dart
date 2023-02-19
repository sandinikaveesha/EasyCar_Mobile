
import 'package:rental_car_app/Repositories/category_service.dart';
import 'package:rental_car_app/Models/Category.dart';
import '../Constants/constant.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CategoryRepository implements CategoryService{
  @override
  Future<List<Category>> getCategories() async{
    List<Category> list = [];
    var url = Uri.parse('$baseUrl/category/all');
    var response = await http.get(url,
        headers: {'Content-Type': 'application/json'});
    if(response.statusCode == 200){
      var body = json.decode(response.body);
      if(body.length>0){
        for (var category in body){
          list.add(Category.fromJson(category));
        }
        return list;
      }
      else{
        return list;
      }
    }
    else{
      return list;
    }
  }
  
}