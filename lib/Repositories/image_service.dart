import 'package:rental_car_app/Models/Image.dart';

abstract class ImageService{
  Future<List<VehicleImage>> getImages(int vehicle);
}