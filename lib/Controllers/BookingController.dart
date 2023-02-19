import 'package:rental_car_app/Models/Booking.dart';
import 'package:rental_car_app/Repositories/booking_service.dart';

class BookingController{
  final BookingService service;
  BookingController(this.service);

  Future<String> add(Object data){
    return service.add(data);
  }

  Future<List<Booking>> getBookings(int user){
    return service.getBookings(user);
  }
}