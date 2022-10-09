import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../constance.dart';
import '../../core/view_model/auth_view_model.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_button_social.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_text_form_field.dart';
import 'register_view.dart';

class LoginView extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding:
            const EdgeInsets.only(top: 100, right: 20, left: 20, bottom: 60),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(text: 'Welcome,', fontSize: 30),
                  InkWell(
                    onTap: () {
                      Get.to(RegisterView());
                    },
                    child: CustomText(
                        text: 'Sign Up', fontSize: 18, color: primaryColor),
                  ),
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
                onSave: (value) {
                  controller.email = value!;
                },
                validator: (value) {
                  if (value == null) {
                    print('ERROR');
                  }
                },
              ),
              const SizedBox(
                height: 40,
              ),
              CustomTextFormField(
                text: 'Password',
                hint: '*********',
                onSave: (value) {
                  controller.password = value!;
                },
                validator: (value) {
                  if (value == null) {
                    print('ERROR');
                  }
                },
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
                  _formKey.currentState!.save();
                  if (_formKey.currentState!.validate()) {
                    controller.signInWithEmailAndPassword();
                  }
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
      ),
    );
  }
}
