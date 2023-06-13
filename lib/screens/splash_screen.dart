import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHomeScreen();
  }

  _navigateToHomeScreen() async {
    await Future.delayed(const Duration(milliseconds: 5000), () {});
    Navigator.pushReplacementNamed(context, "/screens");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Container()
            ),
            Center(
              child: RichText(
                text: const TextSpan(
                  text: 'by ',
                  style: TextStyle(
                      fontSize: 12,
                      color: Color(
                        0xff476895,
                      ),
                      fontFamily: "Mic 32"),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'b',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Mic 32")),
                    TextSpan(
                        text: 'izz',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Mic 32")),
                    TextSpan(
                        text: 'S',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Mic 32")),
                    TextSpan(
                        text: 'mart',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Mic 32")),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ));
  }
}