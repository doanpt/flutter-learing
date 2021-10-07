import 'package:car_control/controller/home_controller.dart';
import 'package:car_control/utils/const.dart';
import 'package:car_control/widgets/car_bottom_navigation.dart';
import 'package:car_control/widgets/door_lock.dart';
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
          bottomNavigationBar: CarBottomNavigation(
            onTap: (index) {
              _homeController.onBottomNavItemChange(index);
            },
            selectedTab: _homeController.selectedBottomTab,
          ),
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
                    AnimatedPositioned(
                      right: _homeController.selectedBottomTab == 0
                          ? constraints.maxWidth * 0.05
                          : constraints.maxWidth / 2,
                      duration: defaultDuration,
                      child: AnimatedOpacity(
                        opacity: _homeController.selectedBottomTab == 0 ? 1 : 0,
                        duration: defaultDuration,
                        child: DoorLock(
                          press: _homeController.updateRightDoorLock,
                          isLock: _homeController.isRightDoorLock,
                        ),
                      ),
                    ),
                    Positioned(
                      left: constraints.maxWidth * 0.05,
                      child: DoorLock(
                        press: _homeController.updateLeftDoorLock,
                        isLock: _homeController.isLeftDoorLock,
                      ),
                    ),
                    Positioned(
                      top: constraints.maxHeight * 0.15,
                      child: DoorLock(
                        press: _homeController.updateBonnetDoorLock,
                        isLock: _homeController.isBonnetLock,
                      ),
                    ),
                    Positioned(
                      bottom: constraints.maxHeight * 0.18,
                      child: DoorLock(
                        press: _homeController.updateLeftDoorLock,
                        isLock: _homeController.isTrunkLock,
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
