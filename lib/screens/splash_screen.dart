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
    await Future.delayed(const Duration(milliseconds: 1000), () {});
    Navigator.pushReplacementNamed(context, "/screens");
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: Text(
        "MPLUSSOFT",
        style: TextStyle(
            color: Color(0xffE36DA6),
            fontWeight: FontWeight.bold,
            fontSize: 24),
      ),
    ));
  }
}
