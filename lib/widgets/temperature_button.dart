import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:car_control/utils/const.dart';

class TempButtonWidget extends StatelessWidget {
  const TempButtonWidget(
      {Key? key,
      required this.svgSrc,
      required this.title,
      this.isActive = true,
      required this.press})
      : super(key: key);
  final String svgSrc;
  final String title;
  final bool isActive;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        children: [
          AnimatedContainer(
            duration: Duration(
              milliseconds: 200,
            ),
            curve: Curves.easeInOutBack,
            child: Container(
              width: isActive ? 80 : 50,
              height: isActive ? 80 : 50,
              child: SvgPicture.asset(
                svgSrc,
                color: isActive ? primaryColor : Colors.white38,
              ),
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          AnimatedDefaultTextStyle(
            duration: Duration(
              microseconds: 200,
            ),
            style: TextStyle(
              fontSize: 16,
              color: isActive ? primaryColor : Colors.white38,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            ),
            child: Text(
              title.toUpperCase(),
            ),
          ),
        ],
      ),
    );
  }
}
