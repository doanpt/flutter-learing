import 'package:car_control/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CarBottomNavigation extends StatelessWidget {
  const CarBottomNavigation({
    Key? key,
    required this.selectedTab,
    required this.onTap,
  }) : super(key: key);
  final int selectedTab;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.black,
      type: BottomNavigationBarType.fixed,
      currentIndex: selectedTab,
      items: List.generate(
        navIconSrc.length,
        (index) => BottomNavigationBarItem(
            icon: SvgPicture.asset(
              navIconSrc[index],
              color: index == selectedTab ? primaryColor : Colors.white54,
            ),
            label: ""),
      ),
      onTap: onTap,
    );
  }
}

List<String> navIconSrc = [
  "assets/icons/Lock.svg",
  "assets/icons/Charge.svg",
  "assets/icons/Temp.svg",
  "assets/icons/Tyre.svg",
];
