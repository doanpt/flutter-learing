import 'package:car_control/controller/home_controller.dart';
import 'package:car_control/utils/const.dart';
import 'package:car_control/widgets/battery_status.dart';
import 'package:car_control/widgets/car_bottom_navigation.dart';
import 'package:car_control/widgets/door_lock.dart';
import 'package:car_control/widgets/temperature_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final HomeController _homeController = HomeController();
  late AnimationController _batteryAnimationController;
  late Animation<double> _animationBattery;
  late Animation<double> _animationBatteryStatus;
  late Animation<double> _animationCarShift;

  late AnimationController _tempAnimationController;

  void setupTempAnimationController() {
    _tempAnimationController = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 1500,
      ),
    );
    _animationCarShift = CurvedAnimation(
      parent: _tempAnimationController,
      //at first time we will wait, so that battery stats animation can complete
      curve: Interval(0.2, 0.4),
    );
  }

  void setupBatteryAnimation() {
    _batteryAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
    );

    _animationBattery = CurvedAnimation(
      parent: _batteryAnimationController,
      //Duration 600=> 0.0 to 0.5 mean animation will start from 0 and end in 300
      curve: Interval(0.0, 0.5),
    );

    _animationBatteryStatus = CurvedAnimation(
      parent: _batteryAnimationController,
      //Duration 600=> 0.6 to 1 mean animation will start from 360 and end in 600
      curve: Interval(0.6, 1),
    );
  }

  @override
  void initState() {
    setupBatteryAnimation();
    setupTempAnimationController();
    super.initState();
  }

  @override
  void dispose() {
    _batteryAnimationController.dispose();
    _tempAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: (ctx, snapshot) {
        return Scaffold(
          bottomNavigationBar: CarBottomNavigation(
            onTap: (index) {
              if (index == 1) {
                _batteryAnimationController.forward();
              } else if (_homeController.selectedBottomTab == 1 && index != 1) {
                _batteryAnimationController.reverse(from: 0.7);
              }
              if (index == 2) {
                _tempAnimationController.forward();
              } else if (_homeController.selectedBottomTab == 2 && index != 2) {
                _tempAnimationController.reverse(from: 0.4);
              }
              _homeController.onBottomNavItemChange(index);
            },
            selectedTab: _homeController.selectedBottomTab,
          ),
          body: SafeArea(
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                print(_animationBattery.value);
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: constraints.maxWidth,
                      height: constraints.maxHeight,
                    ),
                    Positioned(
                      left: constraints.maxWidth / 2 * _animationCarShift.value,
                      width: constraints.maxWidth,
                      height: constraints.maxHeight,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: constraints.maxHeight * 0.1),
                        child: SvgPicture.asset(
                          'assets/icons/Car.svg',
                          width: double.infinity,
                        ),
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
                    AnimatedPositioned(
                      left: _homeController.selectedBottomTab == 0
                          ? constraints.maxWidth * 0.05
                          : constraints.maxWidth / 2,
                      duration: defaultDuration,
                      child: AnimatedOpacity(
                        opacity: _homeController.selectedBottomTab == 0 ? 1 : 0,
                        duration: defaultDuration,
                        child: DoorLock(
                          press: _homeController.updateLeftDoorLock,
                          isLock: _homeController.isLeftDoorLock,
                        ),
                      ),
                    ),
                    AnimatedPositioned(
                      top: _homeController.selectedBottomTab == 0
                          ? constraints.maxHeight * 0.15
                          : constraints.maxHeight / 2,
                      duration: defaultDuration,
                      child: AnimatedOpacity(
                        opacity: _homeController.selectedBottomTab == 0 ? 1 : 0,
                        duration: defaultDuration,
                        child: DoorLock(
                          press: _homeController.updateBonnetDoorLock,
                          isLock: _homeController.isBonnetLock,
                        ),
                      ),
                    ),
                    AnimatedPositioned(
                      top: _homeController.selectedBottomTab == 0
                          ? constraints.maxHeight * 0.15
                          : constraints.maxHeight / 2,
                      duration: defaultDuration,
                      child: AnimatedOpacity(
                        opacity: _homeController.selectedBottomTab == 0 ? 1 : 0,
                        duration: defaultDuration,
                        child: DoorLock(
                          press: _homeController.updateBonnetDoorLock,
                          isLock: _homeController.isBonnetLock,
                        ),
                      ),
                    ),
                    AnimatedPositioned(
                      bottom: _homeController.selectedBottomTab == 0
                          ? constraints.maxHeight * 0.15
                          : constraints.maxHeight / 2,
                      duration: defaultDuration,
                      child: AnimatedOpacity(
                        opacity: _homeController.selectedBottomTab == 0 ? 1 : 0,
                        duration: defaultDuration,
                        child: DoorLock(
                          press: _homeController.updateLeftDoorLock,
                          isLock: _homeController.isTrunkLock,
                        ),
                      ),
                    ),
                    Opacity(
                      opacity: _animationBattery.value,
                      child: SvgPicture.asset(
                        'assets/icons/Battery.svg',
                        width: constraints.maxWidth * 0.45,
                      ),
                    ),
                    Positioned(
                      top: 50 * (1 - _animationBatteryStatus.value),
                      height: constraints.maxHeight,
                      width: constraints.maxWidth,
                      child: Opacity(
                        opacity: _animationBatteryStatus.value,
                        child: BatteryStatus(
                          constraints: constraints,
                        ),
                      ),
                    ),
                    TemperatureDetail(
                      tempController: _homeController,
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
      animation: Listenable.merge(
        [
          _homeController,
          _batteryAnimationController,
          _tempAnimationController,
        ],
      ),
    );
  }
}
