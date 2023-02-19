import 'package:rental_car_app/Models/Image.dart';
import 'package:rental_car_app/Repositories/image_service.dart';

class ImageController{
  final ImageService service;
  ImageController(this.service);

  Future<List<VehicleImage>> getImages(int vehicle)async{
    return await service.getImages(vehicle);
  }
}