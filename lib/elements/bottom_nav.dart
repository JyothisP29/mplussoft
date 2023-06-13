import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../helper/all_screens.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Screens.selectedIndexNotifier,
      builder: (BuildContext ctx, int updated, Widget? _) {
        return Container(
          decoration: const BoxDecoration(
            color: Color(0xffEBECF2),
          ),
          height: 48,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(18),
                topLeft: Radius.circular(18)),
            child: BottomNavigationBar(
              elevation: 0,
              selectedLabelStyle: const TextStyle(
                  fontSize: 10, fontWeight: FontWeight.bold),
              backgroundColor: Colors.white,
              selectedItemColor: Theme.of(context).primaryColor,
              unselectedItemColor: Colors.grey,
              unselectedLabelStyle: const TextStyle(color: Colors.grey),
              currentIndex: updated,
              onTap: (newIndex) {
                if (kDebugMode) {
                  print(newIndex);
                }
                Screens.selectedIndexNotifier.value = newIndex;
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home_outlined,
                    size: 25,
                  ),
                  label: 'Dashboard',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.local_offer_outlined,
                    size: 25,
                  ),
                  label: 'Packages',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.timelapse_sharp,
                    size: 25,
                  ),
                  label: 'Bookings',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person,
                    size: 25,
                  ),
                  label: 'Profile',
                ),
              ],
            ),
          ),
        );
      },
    );
  }


}
