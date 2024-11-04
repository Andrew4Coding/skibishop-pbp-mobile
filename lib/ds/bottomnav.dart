import 'package:flutter/material.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbar();
}

class _BottomNavbar extends State<BottomNavbar> {
  // List of pages for each tab
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            spreadRadius: 5,
            blurRadius: 10,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(icon: Icons.home, index: 0),
          _buildNavItem(icon: Icons.explore, index: 1),
          _buildNavItem(icon: Icons.person, index: 2),
        ],
      ),
    );
  }

  Widget _buildNavItem({required IconData icon, required int index}) {
    Color color = _selectedIndex == index ? Colors.blue : Colors.grey;

    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: color,
            size: 28, // Slightly larger icon for a minimalist look
          ),
          const SizedBox(height: 5),
          Container(
            height: 4,
            width: 20,
            decoration: BoxDecoration(
              color: _selectedIndex == index ? Colors.blue : Colors.transparent,
              borderRadius: BorderRadius.circular(2),
            ),
          )
        ],
      ),
    );
  }
}
