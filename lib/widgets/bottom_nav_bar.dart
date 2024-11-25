import 'package:bcoder_assignment/screens/booking/booking_screen.dart';
import 'package:bcoder_assignment/screens/profile/profile_screen.dart';
import 'package:bcoder_assignment/screens/wallet/wallet_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;
  final List<Widget> _screens = [
    const BookingScreen(),
    const WalletScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.black87,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        child: GNav(
          backgroundColor: Colors.transparent,
          color: Colors.white,
          activeColor: Colors.white,
          tabBackgroundColor: Colors.blue,
          gap: 8,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          duration: const Duration(milliseconds: 400),
          tabs: const [
            GButton(
              icon: Icons.calendar_month,
              text: 'Calendar',
            ),
            GButton(
              icon: Icons.wallet,
              text: 'Wallet',
            ),
            GButton(
              icon: Icons.person,
              text: 'Profile',
            ),
          ],
          selectedIndex: _selectedIndex,
          onTabChange: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
      ),
    );
  }
}
