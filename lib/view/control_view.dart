import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:my_app/core/view_model/auth_view_model.dart';
import 'package:my_app/view/auth/login_screen.dart';
import 'package:my_app/view/home_view.dart';

class ControlView extends GetWidget<AuthViewModel> {
  const ControlView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (Get.find<AuthViewModel>().user != null)
          ? HomeView()
          : LoginScreen();
    });
  }
}
