import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
  // we use HomeController for logical part
  int selectedBottomTab = 0;

  bool isRightDoorLock = true;
  bool isLeftDoorLock = true;
  bool isBonnetLock = true;
  bool isTrunkLock = true;
  bool isCoolSelected = true;

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
}