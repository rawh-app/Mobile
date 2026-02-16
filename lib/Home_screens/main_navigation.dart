import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:rawh/Home_screens/gamescreen.dart';
import 'homescreen.dart';
import 'package:rawh/survey/firstScreen.dart';

// استبدلي دول بصفحاتك الحقيقية

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;

  // 📌 ليست الصفحات اللي بيتنقل بينها
  final List<Widget> _pages = [
    const Homescreen(), // index 0
    const Gamescreen(), // index 1
    const FirstScreenSurvey(), // index 2
    // index 3
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: _pages[_currentIndex],

        bottomNavigationBar: Container(
          height: 90,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 10),
            ],
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
          ),
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.transparent,
            elevation: 0,
            selectedItemColor: const Color(0xff2874B9),
            unselectedItemColor: Colors.grey,
            showUnselectedLabels: true,

            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },

            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
              BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: ''),
              BottomNavigationBarItem(
                icon: Icon(Bootstrap.clipboard2_pulse_fill),
                label: '',
              ),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
            ],
          ),
        ),
      ),
    );
  }
}
