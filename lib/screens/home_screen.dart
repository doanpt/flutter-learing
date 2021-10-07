import 'package:car_control/controller/home_controller.dart';
import 'package:car_control/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final HomeController _homeController = HomeController();

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: (ctx, snapshot) {
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
                      child: GestureDetector(
                        onTap: _homeController.updateRightDoorLock,
                        child: AnimatedSwitcher(
                          duration: defaultDuration,
                          transitionBuilder: (child, animation) =>
                              ScaleTransition(
                            scale: animation,
                            child: child,
                          ),
                          child: _homeController.isRightDoorLock
                              ? SvgPicture.asset(
                                  'assets/icons/door_lock.svg',
                                  key: ValueKey("lock"),
                                )
                              : SvgPicture.asset(
                                  'assets/icons/door_unlock.svg',
                                  key: ValueKey("unlock"),
                                ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
      animation: _homeController,
    );
  }
}
