import 'package:flutter/material.dart';

class DrawerElement extends StatefulWidget {
  const DrawerElement({Key? key}) : super(key: key);

  @override
  State<DrawerElement> createState() => _DrawerElementState();
}

class _DrawerElementState extends State<DrawerElement> {
  List<String> options = [
    "Home",
    "Book A Nanny",
    "How It Works",
    "Why Nanny Vanny",
    "My Bookings",
    "My Profile",
    "Support"
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(0), bottomRight: Radius.circular(0)),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 30.0, right: 30),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              const CircleAvatar(
                  radius: 46,
                  backgroundColor: Color(0xffE36DA6),
                backgroundImage: AssetImage("asset/images/profile_pic.png"),),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Emily Cyrus",
                style: TextStyle(
                    color: Color(0xffE36DA6),
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 30,
              ),
              ListView.separated(
                shrinkWrap: true,
                itemCount: options.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                        child: Text(
                          options.elementAt(index),
                          style:
                              const TextStyle(color: Color(0xff262F71), fontSize: 16),
                        ),
                      ),
                    ],
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Container(
                    height: .2,
                    color: const Color(0xffE36DA6),
                    width: MediaQuery.of(context).size.width,
                  );
                },
              )
            ],
          ),
        ));
  }
}
