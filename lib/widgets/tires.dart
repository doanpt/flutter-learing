import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

List<Widget> getTires(BoxConstraints constraints) {
  return [
    Positioned(
      left: constraints.maxWidth * 0.2,
      top: constraints.maxHeight * 0.22,
      child: SvgPicture.asset(
        "assets/icons/FL_Tyre.svg",
      ),
    ),
    Positioned(
      left: constraints.maxWidth * 0.2,
      top: constraints.maxHeight * 0.62,
      child: SvgPicture.asset(
        "assets/icons/FL_Tyre.svg",
      ),
    ),
    Positioned(
      right: constraints.maxWidth * 0.2,
      top: constraints.maxHeight * 0.22,
      child: SvgPicture.asset(
        "assets/icons/FL_Tyre.svg",
      ),
    ),
    Positioned(
      right: constraints.maxWidth * 0.2,
      top: constraints.maxHeight * 0.62,
      child: SvgPicture.asset(
        "assets/icons/FL_Tyre.svg",
      ),
    )
  ];
}
