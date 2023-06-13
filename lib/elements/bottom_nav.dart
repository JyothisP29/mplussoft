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
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(18),
                    topLeft: Radius.circular(18)),
                child: BottomNavigationBar(
                  selectedLabelStyle: const TextStyle(
                      fontSize: 10, fontWeight: FontWeight.bold),
                  backgroundColor: Colors.white,
                  selectedItemColor: Theme.of(context).primaryColor,
                  currentIndex: updated,
                  onTap: (newIndex) {
                    if (kDebugMode) {
                      print(newIndex);
                    }
                    Screens.selectedIndexNotifier.value = newIndex;
                  },
                  items: [
                    const BottomNavigationBarItem(
                      icon: Icon(
                        Icons.home_outlined,
                        size: 25,
                      ),
                      label: 'Dashboard',
                    ),
                    BottomNavigationBarItem(
                      icon: CircleAvatar(
                        radius: 0,
                        backgroundColor: Colors.grey,
                        child: Image.asset(
                          "assets/QR.png",
                          width: 18,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                      label: '',
                    ),
                    const BottomNavigationBarItem(
                      icon: Icon(
                        Icons.settings_outlined,
                        size: 25,
                      ),
                      label: 'Settings',
                    ),
                  ],
                ),
              ),
              Center(
                child: InkWell(

                  child: SizedBox(
                    child: CircleAvatar(
                      radius: 22,
                      backgroundColor: Colors.grey,
                      child: Image.asset(
                        "assets/images/QR.png",
                        width: 24,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }


}
