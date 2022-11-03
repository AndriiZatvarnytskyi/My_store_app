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

  LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding:
            const EdgeInsets.only(top: 100, right: 20, left: 20, bottom: 60),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CustomText(text: 'Welcome,', fontSize: 30),
                    InkWell(
                      onTap: () {
                        Get.to(RegisterView());
                      },
                      child: const CustomText(
                          text: 'Sign Up', fontSize: 18, color: primaryColor),
                    ),
                  ],
                ),
                const CustomText(
                  text: 'Sign in to Continue',
                  fontSize: 14,
                  color: Colors.grey,
                ),
                const SizedBox(
                  height: 100,
                ),

                CustomTextFormField(
                    text: 'Email',
                    hint: 'iamdavid@gmail.com',
                    onSave: (value) {
                      controller.email = value!;
                    },
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'you must write your email';
                      }
                      return null;
                    }),
                const SizedBox(
                  height: 40,
                ),

                const PasswordTextFormField(),

                const SizedBox(
                  height: 10,
                ),
                const CustomText(
                  text: 'Forgot Password?',
                  fontSize: 14,
                  alignment: Alignment.topRight,
                ),
                const SizedBox(
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
                const SizedBox(
                  height: 20,
                ),
                const CustomText(
                  text: '-OR-',
                  alignment: Alignment.center,
                ),

                // CustomButtonSocial(
                //   onPressed: () {
                //     // controller.facebookSigningMethod();
                //   },
                //   text: 'Sign In with Facebook',
                //   imageName: 'assets/icons/facebook.png',
                // ),
                const SizedBox(
                  height: 20,
                ),
                CustomButtonSocial(
                  onPressed: () {
                    controller.signInWithGoogle();
                  },
                  text: 'Sign In with Google',
                  imageName: 'assets/icons/google.png',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PasswordTextFormField extends StatefulWidget {
  const PasswordTextFormField({super.key});

  @override
  State<PasswordTextFormField> createState() => _PasswordTextFormFieldState();
}

class _PasswordTextFormFieldState extends State<PasswordTextFormField> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthViewModel>(
      init: AuthViewModel(),
      builder: (controller) => Column(
        children: [
          CustomText(
            text: 'Password',
            fontSize: 14,
            color: Colors.grey.shade900,
          ),
          TextFormField(
            onSaved: (value) {
              controller.password = value!;
            },
            validator: (String? value) {
              if (value!.isEmpty) {
                return 'you must write password';
              }
              return null;
            },
            obscureText: _obscureText,
            decoration: InputDecoration(
                suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                    child: Icon(_obscureText
                        ? Icons.visibility_off
                        : Icons.visibility)),
                hintText: '*********',
                hintStyle: const TextStyle(color: Colors.grey),
                fillColor: Colors.white),
          ),
        ],
      ),
    );
  }
}
