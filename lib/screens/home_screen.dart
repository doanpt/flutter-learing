import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return Stack(
              alignment: Alignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: constraints.maxHeight * 0.1),
                  child: SvgPicture.asset(
                    'assets/icons/Car.svg',
                    width: double.infinity,
                  ),
                ),
                Positioned(
                  right: constraints.maxWidth * 0.05,
                  child: SvgPicture.asset('assets/icons/door_lock.svg'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
