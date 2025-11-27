import 'package:assignment_02/screens/card_page.dart';
import 'package:assignment_02/screens/home_page.dart';
import 'package:assignment_02/screens/profile_page.dart';
import 'package:assignment_02/screens/report_page.dart';
import 'package:assignment_02/widgets/dashboard_header.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ---------------- BODY -----------------
      body: Column(
        children: [
          const SizedBox(height: 6),
          const DashboardHeader(),  // 👈 Header on all screens

          // 👇 PageView must be wrapped inside Expanded
          Expanded(
            child: PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                HomePage(),
                ReportPage(),
                CardPage(),
                ProfilePage(),
              ],
            ),
          ),
        ],
      ),

      // ---------------- BOTTOM NAV -----------------
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        elevation: 10,

        currentIndex: _currentIndex,
        onTap: (i) {
          setState(() => _currentIndex = i);
          _pageController.jumpToPage(i);
        },

        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.receipt_long), label: "Reports"),
          BottomNavigationBarItem(icon: Icon(Icons.credit_card), label: "Cards"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
