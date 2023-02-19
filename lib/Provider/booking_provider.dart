import 'package:flutter/widgets.dart';
import 'package:rental_car_app/Controllers/BookingController.dart';
import 'package:rental_car_app/Models/Booking.dart';
import 'package:rental_car_app/Repositories/booking_repository.dart';

class BookingProvider with ChangeNotifier{
  var _bookingController = BookingController(BookingRepository());
  // States
  List<Booking> _anchor = [];
  List<Booking> _bookings = [];
  List<Booking> get bookings => _bookings;
  List<Booking> _history = [];
  List<Booking> get history => _history;

  void fetchBookings(int user) async{
    List<Booking> response = await _bookingController.getBookings(user);
    _anchor = response;
    _bookings = _anchor.where((element) => element.status == "Pending").toList();
    _history = _anchor.where((element) => element.status != "Pending").toList();
    notifyListeners();
  }
}