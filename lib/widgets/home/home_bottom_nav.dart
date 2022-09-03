import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:haul27/constants/app_colors.dart';

class HaulBottomNavWidget extends StatefulWidget {
  const HaulBottomNavWidget({super.key, required this.onTap});
  final Function(int) onTap;
  @override
  State<HaulBottomNavWidget> createState() => _HaulBottomNavWidgetState();
}

class _HaulBottomNavWidgetState extends State<HaulBottomNavWidget> {
  final _items = [
    BottomNavigationBarItem(
        icon: SvgPicture.asset('assets/home.svg'), label: 'Home'),
    BottomNavigationBarItem(
        icon: SvgPicture.asset('assets/ride.svg'), label: 'Ride'),
    BottomNavigationBarItem(
        icon: SvgPicture.asset('assets/profile.svg'), label: 'You'),
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: _items,
      currentIndex: _currentIndex,
      backgroundColor: kAscentLightPrimary,
      selectedItemColor: kGreyscaleLightWhite,
      unselectedItemColor: kGreyscaleTextQuartenery,
      onTap: (_) {
        setState(() {
          _currentIndex = _;
        });
        widget.onTap(_currentIndex);
      },
    );
  }
}
