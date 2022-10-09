import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/view/auth/login_view.dart';

import '../../constance.dart';
import '../../core/view_model/auth_view_model.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_text_form_field.dart';

class RegisterView extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: (() {
            Get.off(LoginView());
          }),
        ),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(top: 100, right: 20, left: 20, bottom: 60),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomText(text: 'Sign Up,', fontSize: 30),
              const SizedBox(
                height: 40,
              ),
              CustomTextFormField(
                text: 'Name',
                hint: 'Pesa',
                onSave: (value) {
                  controller.name = value!;
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
              SizedBox(
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
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
