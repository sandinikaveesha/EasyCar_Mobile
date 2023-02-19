import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rental_car_app/Components/custom_bottom_navigation_bar.dart';
import 'package:rental_car_app/Components/history_details.dart';
import 'package:rental_car_app/Models/Booking.dart';
import 'package:rental_car_app/Provider/booking_provider.dart';

import '../Components/custom_back_button.dart';
import '../Components/pending_details.dart';
import '../Constants/constant.dart';
import 'home_screen.dart';

class BookingDetailsScreen extends StatelessWidget {
  const BookingDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Booking> _bookedList =context.watch<BookingProvider>().bookings;
    List<Booking> _historyList = context.watch<BookingProvider>().history;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Container(
          width: double.infinity,
          color: const Color.fromARGB(255, 22, 22, 22),
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            top: 30,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30,),
              Row(
                children: [
                  CustomBackButton(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                      );
                    },
                  ),
                  const Text(
                    "Booking Details",
                    style: mainHeadingLight,
                  ),
                ],
              ),
              const SizedBox(height: 20,),
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 5.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: const Color.fromARGB(255, 163, 163, 163)),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: TabBar(
                              indicator: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              tabs: const [
                                Tab(
                                  text: "Booked",
                                ),
                                Tab(
                                  text: "History",
                                )
                              ]),
                        ),
                      ),
                      SizedBox(
                        height: 500,
                        child: TabBarView(children: [
                          Container(
                            padding: EdgeInsets.only(top: 10),
                            // Todo: Booked Item Card Loading
                            child: SingleChildScrollView(
                                child: Column(
                              children: List.generate(
                                  _bookedList.length,
                                  (index) => PendingDetails(booking: _bookedList[index],)),
                            )),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 10),
                            // Todo: History Item Card Loading
                            child: SingleChildScrollView(
                                child: Column(
                                    children: List.generate(
                                        _historyList.length,
                                        (index) => HistoryDetails(booking: _historyList[index],))
                                    // [
                                    //   HistoryCard(
                                    //     ctx: context,
                                    //     img:
                                    //         "https://globalgrasshopper.com/wp-content/uploads/2012/01/10-of-the-most-beautiful-places-to-visit-in-Laos.jpg",
                                    //   ),
                                    //   HistoryCard(
                                    //     ctx: context,
                                    //     img:
                                    //         "https://www.actual-adventure.com/public/uploads/srilankasirigya.jpg",
                                    //   )
                                    // ]
                                    )),
                          ),
                        ]),
                      )
                    ],
                  ),
                ),
              ),
              
            ],
          ),
        ),
        bottomNavigationBar: const CustomBottomNavigationBar(index: 1),
      ),
    );
  }
}
