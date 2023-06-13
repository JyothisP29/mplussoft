import 'package:flutter/material.dart';
import 'package:mplussoft/screens/bookings.dart';
import 'package:mplussoft/screens/home_screen.dart';

import '../elements/bottom_nav.dart';
import '../screens/packages.dart';
import '../screens/profile.dart';

class Screens extends StatelessWidget {
  Screens({Key? key}) : super(key: key);
  static ValueNotifier<int> selectedIndexNotifier = ValueNotifier(0);
  final _pages = [
    const HomeScreen(),
    const Packages(),
    const Bookings(),
    const Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
          height: 60,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(18),
              topRight: Radius.circular(18),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(.5),
                blurRadius: 5,
              ),
            ],
          ),
          child: const BottomNav()),
      body: SafeArea(
        child: ValueListenableBuilder(
            valueListenable: selectedIndexNotifier,
            builder: (BuildContext context, int updated, _) {
              return _pages[updated];
            }),
      ),
    );
  }
}
