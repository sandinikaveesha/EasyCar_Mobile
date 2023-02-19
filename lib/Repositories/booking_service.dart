import '../Models/Booking.dart';

abstract class BookingService{
  Future<String> add(Object data);
  Future<List<Booking>> getBookings(int user);
}