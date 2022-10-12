import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:my_app/core/view_model/auth_view_model.dart';
import 'package:my_app/view/auth/login_view.dart';
import 'package:my_app/view/home_view.dart';

import '../core/view_model/control_view_model.dart';
import 'cart_view.dart';
import 'profile_view.dart';

class ControlView extends GetWidget<AuthViewModel> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (Get.find<AuthViewModel>().user == null)
          ? LoginView()
          : GetBuilder<ControlViewModel>(
              builder: (controller) => Scaffold(
                  bottomNavigationBar: bottomNavigationBar(),
                  body: controller.currentScreen),
            );
    });
  }

  Widget bottomNavigationBar() {
    return GetBuilder<ControlViewModel>(
        init: ControlViewModel(),
        builder: ((controller) => BottomNavigationBar(
              items: [
                BottomNavigationBarItem(
                    activeIcon: Padding(
                      padding: const EdgeInsets.only(top: 18.0),
                      child: Text('Explore'),
                    ),
                    label: '',
                    icon: Container(
                      width: 25,
                      height: 25,
                      child: Image.asset(
                        'assets/icons/click.png',
                        fit: BoxFit.contain,
                      ),
                    )),
                BottomNavigationBarItem(
                    activeIcon: Padding(
                      padding: const EdgeInsets.only(top: 18.0),
                      child: Text('Cart'),
                    ),
                    label: '',
                    icon: Container(
                      width: 25,
                      height: 25,
                      child: Image.asset(
                        'assets/icons/shopping_cart.png',
                        fit: BoxFit.contain,
                      ),
                    )),
                BottomNavigationBarItem(
                    activeIcon: Padding(
                      padding: const EdgeInsets.only(top: 18.0),
                      child: Text('Account'),
                    ),
                    label: '',
                    icon: Container(
                      width: 25,
                      height: 25,
                      child: Image.asset(
                        'assets/icons/user.png',
                        fit: BoxFit.contain,
                      ),
                    ))
              ],
              currentIndex: controller.navigatorValue,
              onTap: (index) {
                controller.changeSelectedValue(index);
              },
              elevation: 0,
              selectedItemColor: Colors.black,
              backgroundColor: Colors.grey.shade50,
            )));
  }
}
