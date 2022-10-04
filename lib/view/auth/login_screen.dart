import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../constance.dart';
import '../../core/view_model/auth_view_model.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_button_social.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_text_form_field.dart';
import 'second_screen.dart';

class LoginScreen extends
//StatelessWidget
    GetWidget<AuthViewModel> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.only(top: 100, right: 20, left: 20, bottom: 60),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                CustomText(text: 'Welcome,', fontSize: 30),
                CustomText(text: 'Sign Up', fontSize: 18, color: primaryColor),
              ],
            ),
            const CustomText(
              text: 'Sign in to Continue',
              fontSize: 14,
              color: Colors.grey,
            ),
            Expanded(child: Container()),
            CustomTextFormField(
              text: 'Email',
              hint: 'iamdavid@gmail.com',
              onSave: (value) {},
              validator: (value) {},
            ),
            const SizedBox(
              height: 40,
            ),
            CustomTextFormField(
              text: 'Password',
              hint: '*********',
              onSave: (value) {},
              validator: (value) {},
            ),
            const SizedBox(
              height: 10,
            ),
            const CustomText(
              text: 'Forgot Password?',
              fontSize: 14,
              alignment: Alignment.topRight,
            ),
            SizedBox(
              height: 70,
            ),
            CustomButton(
              text: 'SIGN IN',
              onPressed: () {
                Get.to(SecondScreen());
              },
            ),
            SizedBox(
              height: 20,
            ),
            CustomText(
              text: '-OR-',
              alignment: Alignment.center,
            ),
            SizedBox(
              height: 20,
            ),
            CustomButtonSocial(
              onPressed: () {
                // controller.facebookSigningMethod();
              },
              text: 'Sign In with Facebook',
              imageName: 'assets/icons/facebook.png',
            ),
            SizedBox(
              height: 20,
            ),
            CustomButtonSocial(
              onPressed: () {
                controller.googleGignInMethod();
              },
              text: 'Sign In with Google',
              imageName: 'assets/icons/google.png',
            )
          ],
        ),
      ),
    );
  }
}
