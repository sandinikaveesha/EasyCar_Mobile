import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:rental_car_app/Screens/booking_details_screen.dart';
import 'package:rental_car_app/Screens/home_screen.dart';
import 'package:rental_car_app/Screens/profile_screen.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({Key? key, required this.index}) : super(key: key);

  final int index;

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 0;


  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.index;
  }
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GNav(
          selectedIndex: _selectedIndex,
          tabMargin: const EdgeInsets.symmetric(vertical: 5),
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          backgroundColor:const Color.fromARGB(255, 36, 35, 35),
          color: Colors.white,
          activeColor: Colors.white,
          tabBackgroundColor: const Color.fromARGB(156, 0, 0, 0),
          gap: 10,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          
          tabs: [
            GButton(
              icon: Icons.home,
              iconColor: Colors.white,
              text: 'Home',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              },
            ),
            GButton(
              icon: Icons.list,
              iconColor: Colors.white,
              text: 'Bookings',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BookingDetailsScreen(),
                  ),
                );
              },
            ),
            GButton(
              icon: Icons.person,
              iconColor: Colors.white,
              text: 'Profile',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfileScreen(),
                  ),
                );
              },
            ),
          ]),
    );
  }
}
