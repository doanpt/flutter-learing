import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
  // we use HomeController for logical part
  int selectedBottomTab = 0;

  bool isRightDoorLock = true;
  bool isLeftDoorLock = true;
  bool isBonnetLock = true;
  bool isTrunkLock = true;
  bool isCoolSelected = true;

  bool isShowTires = false;
  bool isShowTiresStatus = false;

  void onBottomNavItemChange(int index) {
    selectedBottomTab = index;
    print("index $index");
    notifyListeners();
  }

  void updateRightDoorLock() {
    isRightDoorLock = !isRightDoorLock;
    notifyListeners();
  }

  void updateLeftDoorLock() {
    isLeftDoorLock = !isLeftDoorLock;
    notifyListeners();
  }

  void updateBonnetDoorLock() {
    isBonnetLock = !isBonnetLock;
    notifyListeners();
  }

  void updateTrunkDoorLock() {
    isTrunkLock = !isTrunkLock;
    notifyListeners();
  }

  void updateCoolSelectedTab() {
    isCoolSelected = !isCoolSelected;
    notifyListeners();
  }

  void showTires(int index) {
    if (selectedBottomTab != 3 && index == 3) {
      Future.delayed(
          Duration(
            milliseconds: 400,
          ), () {
        isShowTires = true;
        notifyListeners();
      });
    } else {
      isShowTires = false;
      notifyListeners();
    }
  }

  void typeStatusController(int index) {
    if (selectedBottomTab != 3 && index == 3) {
      Future.delayed(
          Duration(
            milliseconds: 400,
          ), () {
        isShowTiresStatus = true;
        notifyListeners();
      });
    } else {
      isShowTiresStatus = false;
      notifyListeners();
    }
  }
}
