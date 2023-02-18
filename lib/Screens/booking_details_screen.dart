import 'package:flutter/material.dart';

class BookingDetailsScreen extends StatelessWidget {
  const BookingDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: const Color.fromARGB(255, 22, 22, 22),
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          top: 30,
        ),
        child: Column(
          children: [
            const SizedBox(height: 30,),
            Container(
                    margin: EdgeInsets.only(top: 5.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: const Color.fromARGB(255, 163, 163, 163)),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: TabBar(
                          indicator: BoxDecoration(
                            color:  const Color.fromARGB(255, 22, 22, 22),
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
                      // Container(
                      //   // Todo: Booked Item Card Loading
                      //   child: SingleChildScrollView(
                      //       child: Column(
                      //     children: List.generate(
                      //         _bookedList.length,
                      //         (index) => BookedCard(
                      //               booking: _bookedList[index],
                      //             )),
                      //   )),
                      // ),
                      // Container(
                      //   // Todo: History Item Card Loading
                      //   child: SingleChildScrollView(
                      //       child: Column(
                      //           children: List.generate(
                      //               _historyList.length,
                      //               (index) => HistoryCard(
                      //                   ctx: context,
                      //                   booking: _historyList[index]))
                      //           // [
                      //           //   HistoryCard(
                      //           //     ctx: context,
                      //           //     img:
                      //           //         "https://globalgrasshopper.com/wp-content/uploads/2012/01/10-of-the-most-beautiful-places-to-visit-in-Laos.jpg",
                      //           //   ),
                      //           //   HistoryCard(
                      //           //     ctx: context,
                      //           //     img:
                      //           //         "https://www.actual-adventure.com/public/uploads/srilankasirigya.jpg",
                      //           //   )
                      //           // ]
                      //           )),
                      // ),
                    ]),
                  )
          ],
        ),
      ),
    );
  }
}
