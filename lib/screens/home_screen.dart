import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../controller/controller.dart';
import '../elements/drawer_element.dart';
import '../helper/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends StateMVC<HomeScreen> {
  late DetailsController _con;
  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey();

  _HomeScreenState() : super(DetailsController()) {
    _con = controller as DetailsController;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            key: _scaffoldState,
            drawer: const DrawerElement(),
            body: _con.isLoading
                ? const Center(child: CircularProgressIndicator())
                : Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          sbh20,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: () {
                                  _scaffoldState.currentState?.openDrawer();
                                },
                                child: const Icon(
                                  Icons.more_vert,
                                  color: Colors.pink,
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Column(
                                children: [
                                  CircleAvatar(
                                    radius: 34,
                                    backgroundColor: const Color(0xffE36DA6),
                                    child: CircleAvatar(
                                      radius: 32,
                                      backgroundColor: Colors.grey,
                                      backgroundImage: AssetImage("asset/images/profile_pic.png"),

                                    ),
                                  ),
                                ],
                              ),
                              sbw10,
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Welcome",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  Text(
                                    "Emily Cyrus",
                                    style: TextStyle(
                                        color: Color(0xffF5B5CF),
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Stack(
                            children: [
                              SizedBox(
                                height: 250,
                                child: Center(
                                  child: Container(
                                    height: 180,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: const Color(0xffF5B5CF)),
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(left: 20.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          sbh20,
                                          const Text(
                                            "Nanny And \nBabysitting Services",
                                            style: TextStyle(
                                                color: Color(0xff2A2347),
                                                fontSize: 20),
                                          ),
                                          sbh10,
                                          Container(
                                            decoration: BoxDecoration(
                                                color: const Color(0XFF2A2347),
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            child: const Padding(
                                              padding: EdgeInsets.only(
                                                  left: 15.0,
                                                  right: 15,
                                                  top: 2,
                                                  bottom: 2),
                                              child: Text(
                                                "Book Now",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                child: Image.asset(
                                  'asset/images/nanny.png',
                                ),
                              )
                            ],
                          ),
                          currentBookingSection(),
                          sbh20,
                          packagesListSection()
                        ],
                      ),
                    ),
                  )));
  }

  Widget packagesListSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Packages",
          style: TextStyle(
              color: Color(0xff262F71),
              fontWeight: FontWeight.bold,
              fontSize: 18),
        ),
        sbh20,
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: (_con.data?.packages ?? []).length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final isOdd = index % 2 != 0;
            final package = (_con.data?.packages ?? [])[index];
            return Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: isOdd
                          ? const Color(0xff80ABDB)
                          : const Color(0xffF5B5CF)),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              "asset/images/calender.png",
                              height: 30,
                              width: 30,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: isOdd
                                      ? const Color(0xff0098D0)
                                      : const Color(0xffe36da6),
                                  borderRadius: BorderRadius.circular(15)),
                              child: const Padding(
                                padding: EdgeInsets.only(
                                    left: 15.0, right: 15, top: 3, bottom: 3),
                                child: Text(
                                  "Book Now",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.white),
                                ),
                              ),
                            )
                          ],
                        ),
                        sbh20,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              package.packageName,
                              style: const TextStyle(
                                  color: Color(0xff262F71), fontSize: 16),
                            ),
                            Row(
                              children: [
                                const Text("₹",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff262F71),
                                        fontSize: 18)),
                                Text(package.price.toString(),
                                    style: const TextStyle(
                                        color: Color(0xff262F71),
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                              ],
                            )
                          ],
                        ),
                        sbh20,
                        Text(
                          package.description,
                          style: TextStyle(
                              color: Colors.grey.shade800, fontSize: 12),
                        )
                      ],
                    ),
                  ),
                ),
                sbh20
              ],
            );
          },
        ),
      ],
    );
  }

  Widget currentBookingSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Your Current Booking",
          style: TextStyle(
              color: Color(0xff262F71),
              fontWeight: FontWeight.bold,
              fontSize: 18),
        ),
        sbh10,
        Padding(
          padding: const EdgeInsets.only(left: 2.0, right: 2),
          child: Container(
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
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 25.0, bottom: 25, right: 20, left: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _con.data?.currentBookings.packageLabel ?? "",
                        style: const TextStyle(
                            color: Color(0xffE36DA6), fontSize: 14),
                      ),
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: const Color(0xffE36DA6)),
                          child: const Padding(
                            padding: EdgeInsets.only(
                                top: 4.0, bottom: 4, left: 25, right: 25),
                            child: Text(
                              "Start",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 11),
                            ),
                          ))
                    ],
                  ),
                  sbh20,
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "From",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12),
                            ),
                            sbh10,
                            Row(
                              children: [
                                Image.asset(
                                  "asset/images/calender.png",
                                  height: 15,
                                  width: 15,
                                ),
                                sbw5,
                                Text(
                                  _con.data?.currentBookings.fromDate ?? "",
                                  style: TextStyle(
                                      color: Colors.grey.shade800,
                                      fontSize: 12),
                                ),
                              ],
                            ),
                            sbh5,
                            Row(
                              children: [
                                const Icon(
                                  Icons.timelapse_sharp,
                                  color: Color(0xffE36DA6),
                                  size: 16,
                                ),
                                sbw5,
                                Text(
                                  _con.data?.currentBookings.fromTime ?? "",
                                  style: TextStyle(
                                      color: Colors.grey.shade800,
                                      fontSize: 12),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "To",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12),
                            ),
                            sbh10,
                            Row(
                              children: [
                                Image.asset(
                                  "asset/images/calender.png",
                                  height: 15,
                                  width: 15,
                                ),
                                sbw5,
                                Text(
                                  _con.data?.currentBookings.toDate ?? "",
                                  style: TextStyle(
                                      color: Colors.grey.shade800,
                                      fontSize: 12),
                                ),
                              ],
                            ),
                            sbh5,
                            Row(
                              children: [
                                const Icon(
                                  Icons.timelapse_sharp,
                                  color: Color(0xffE36DA6),
                                  size: 16,
                                ),
                                sbw5,
                                Text(
                                  _con.data?.currentBookings.toTime ?? "",
                                  style: TextStyle(
                                      color: Colors.grey.shade800,
                                      fontSize: 12),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  sbh20,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color(0xff262F71)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 15.0, top: 3, bottom: 3),
                          child: Row(
                            children: [
                              Image.asset(
                                "asset/images/favourite.png",
                                height: 13,
                                width: 13,
                              ),
                              sbw5,
                              const Text(
                                "Rate us",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color(0xff262F71)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 15.0, top: 3, bottom: 3),
                          child: Row(
                            children: [
                              Image.asset(
                                "asset/images/location.png",
                                height: 13,
                                width: 13,
                              ),
                              sbw5,
                              const Text(
                                "Geolocation",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color(0xff262F71)),
                        child: const Padding(
                          padding: EdgeInsets.only(
                              left: 15, right: 15.0, top: 3, bottom: 3),
                          child: Row(
                            children: [
                              Icon(
                                Icons.camera_enhance_outlined,
                                size: 12,
                                color: Colors.white,
                              ),
                              sbw5,
                              Text(
                                "Survillence",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
