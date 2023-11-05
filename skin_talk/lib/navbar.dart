import 'package:flutter/material.dart';
import 'package:skin_talk/screens/scan/test.dart';

import 'screens/home.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int currentIndex = 0;
  List<Widget> screens = [
    const HomeScreen(),
    const HomeScreen(),
    const Test(),
    const Test()
  ];
  List<Widget> titles = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        elevation: 0,
        title: Row(
          children: [
            SizedBox(
              width: 16,
            ),
            Image.asset(
              'assets/images/logo.png',
              scale: 4.8,
            ),
            Expanded(child: Container()),
            CircleAvatar(
              radius: 24,
              backgroundColor: const Color.fromARGB(96, 199, 199, 199),
              child: IconButton(
                  onPressed: () {
                    setState(() {
                      currentIndex = 3;
                    });
                  },
                  icon: const Icon(
                    Icons.person_2,
                    size: 24,
                  )),
            ),
            SizedBox(
              width: 16,
            ),
          ],
        ),
      ),
      body: screens[currentIndex],
      bottomNavigationBar: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:
              BorderRadius.circular(10), // Add border radius if needed
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 215, 215, 215)
                  .withOpacity(0.30), // Shadow color
              spreadRadius: 1, // Spread radius
              blurRadius: 8, // Blur radius
              offset: Offset(0, 0), // Changes position of shadow
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          elevation: 0,
          selectedFontSize: 12,
          selectedIconTheme: IconThemeData(size: 28),
          selectedItemColor: Color.fromARGB(255, 161, 104, 240),
          unselectedFontSize: 12,
          showUnselectedLabels: true,
          unselectedItemColor: const Color.fromARGB(255, 128, 133, 140),
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_rounded,
                  size: 28,
                ),
                label: "Home",
                backgroundColor: Colors.white),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.book,
                  size: 28,
                ),
                label: "Bookings",
                backgroundColor: Colors.white),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.calendar_month_rounded,
                  size: 28,
                ),
                label: "Plans",
                backgroundColor: Colors.white),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.trolley,
                size: 28,
              ),
              label: "Store",
              backgroundColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
