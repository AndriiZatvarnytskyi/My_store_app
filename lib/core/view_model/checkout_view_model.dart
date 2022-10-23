import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/view/control_view.dart';
import '../../constance.dart';
import '../../helper/enum.dart';

class CheckOutViewModel extends GetxController {
  int get index => _index;
  int _index = 0;

  Pages get pages => _pages;
  Pages _pages = Pages.DeliveryTime;

  late String street1, street2, city, state, country;

  GlobalKey<FormState> fromState = GlobalKey();

  void displayIndex(int tappedDotIndex) {
    if (tappedDotIndex == 0 || tappedDotIndex < 0) {
      _pages = Pages.DeliveryTime;
      _index = tappedDotIndex;
    } else if (tappedDotIndex == 1) {
      _pages = Pages.AddAddress;
      _index = tappedDotIndex;
    } else if (tappedDotIndex == 2) {
      fromState.currentState!.save();
      if (fromState.currentState!.validate()) {
        _pages = Pages.Summary;
        _index = tappedDotIndex;
      }
    } else if (tappedDotIndex == 3) {
      Get.to(ControlView());
      _pages = Pages.DeliveryTime;
      _index = 0;
    }
    update();
  }

  void changeIndex(int i) {
    if (i == 0 || i < 0) {
      _pages == Pages.DeliveryTime;
      _index = i;
    } else if (i == 1) {
      _pages = Pages.AddAddress;
      _index = i;
    } else if (i == 2) {
      fromState.currentState!.save();
      if (fromState.currentState!.validate()) {
        _pages = Pages.Summary;
        _index = i;
      }
    } else if (i == 3) {
      Get.to(ControlView());
      _pages = Pages.DeliveryTime;
      _index = 0;
    }
    update();
  }

  Widget header() {
    return Text(
      headerText(),
      style: TextStyle(
        color: primaryColor,
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
    );
  }

  String headerText() {
    switch (index) {
      case 0:
        return 'Delivery Time';

      case 1:
        return 'Add Address';

      case 2:
        return 'Summary';

      default:
        return 'Introduction';
    }
  }

  Color getColor(int i) {
    if (i == _index) {
      return inProgressColor;
    } else if (i < _index) {
      return Colors.green;
    } else {
      return todoColor;
    }
  }
}
