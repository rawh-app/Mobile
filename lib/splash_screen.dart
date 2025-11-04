import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    /* Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const PageviewScreen()),
      );
    });*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff123655),
      body: Center(
        child: Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              Image.asset('assets/logo.png', width: 100, height: 100),
              const SizedBox(height: 20),
              const Text(
                "RAWH",
                style: TextStyle(letterSpacing: 20, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
