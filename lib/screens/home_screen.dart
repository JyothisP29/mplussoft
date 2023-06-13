import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [Icon(Icons.more_vert)],
            ),
            Row(
              children: [
                Column(
                  children: [
                    CircleAvatar(
                      radius: 16,
                      backgroundColor: Colors.grey,
                    ),
                  ],
                ),
                Column(
                  children: [Text("data"), Text("data")],
                )
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Stack(
              children: [
                Container(
                  height: 250,
                  child: Center(
                    child: Container(
                      height: 180,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.pinkAccent),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Nanny and \nBabysitting Services"),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.blueAccent,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Text("Book Now"),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  child: Image.asset(
                    'asset/img.png',
                  ),
                )
              ],
            ),
            Text("Your Current Booking"),
            Container(
              height: 180,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade200,
                        spreadRadius: 2,
                        blurRadius: 2)
                  ] //BoxShadow

                  ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("One Day Package"),
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.pink),
                          child: Text("Start"))
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("From"),
                            Row(
                              children: [
                                Icon(Icons.calendar_month),
                                Text("12.08.2020"),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.timelapse_sharp),
                                Text("11 pm"),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("To"),
                            Row(
                              children: [
                                Icon(Icons.calendar_month),
                                Text("13.08.2020"),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.timelapse_sharp),
                                Text("07 am"),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(

                        child: Row(
                          children: [Icon(Icons.star), Text("Rate us")],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [Icon(Icons.location_city), Text("Geolocation")],
                        ),
                      ),  Container(
                        child: Row(
                          children: [Icon(Icons.star), Text("Survillence")],
                        ),
                      ),
                    ],
                  ),
                  Text("Packages"),

                  ],),)
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
