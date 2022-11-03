import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/view/auth/login_view.dart';
import '../../core/view_model/auth_view_model.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_text_form_field.dart';

class RegisterView extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  RegisterView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: const EdgeInsets.only(top: 100),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back),
                color: Colors.black,
                onPressed: (() {
                  Get.off(LoginView());
                }),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 30, right: 20, left: 20, bottom: 60),
                child: Column(
                  children: [
                    const CustomText(text: 'Sign Up,', fontSize: 30),
                    const SizedBox(
                      height: 40,
                    ),
                    CustomTextFormField(
                        text: 'Name',
                        hint: 'Pesa',
                        onSave: (value) {
                          controller.name = value!;
                        },
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'you must write your name';
                          }
                          return null;
                        }),
                    const SizedBox(
                      height: 40,
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
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'you must write password';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      height: 70,
                    ),
                    CustomButton(
                      text: 'SIGN UP',
                      onPressed: () {
                        _formKey.currentState!.save();
                        if (_formKey.currentState!.validate()) {
                          controller.createAccountWithEmailAndPassword();
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
