import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/core/view_model/checkout_view_model.dart';
import 'package:my_app/view/widgets/custom_text.dart';
import 'package:my_app/view/widgets/custom_text_form_field.dart';

class AddAddress extends StatefulWidget {
  const AddAddress({super.key});

  @override
  State<AddAddress> createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckOutViewModel>(
      init: CheckOutViewModel(),
      builder: (controller) => Form(
        key: controller.fromState,
        child: Expanded(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const CustomText(
                    text: 'Billing address is the same as delivery addres',
                    fontSize: 20,
                    alignment: Alignment.center,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  CustomTextFormField(
                      text: 'Street 1',
                      hint: '21, Alex Davidson Avenue',
                      onSave: (value) {
                        controller.street1 = value!;
                      },
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'you must write your street';
                        }
                      }),
                  const SizedBox(
                    height: 40,
                  ),
                  CustomTextFormField(
                      text: 'Street 2',
                      hint: 'Opposite Omegatron, Vicent Quarters',
                      onSave: (value) {
                        controller.street2 = value!;
                      },
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'you must write your street';
                        }
                      }),
                  const SizedBox(
                    height: 40,
                  ),
                  CustomTextFormField(
                      text: 'City',
                      hint: 'Victotia Island',
                      onSave: (value) {
                        controller.city = value!;
                      },
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'you must write your city';
                        }
                      }),
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    //width: Get.width,
                    child: Row(children: [
                      Expanded(
                        child: CustomTextFormField(
                            text: 'State',
                            hint: 'Lagos State',
                            onSave: (value) {
                              controller.state = value!;
                            },
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return 'you must write your state';
                              }
                            }),
                      ),
                      const SizedBox(width: 30),
                      Expanded(
                        child: CustomTextFormField(
                            text: 'Country',
                            hint: 'Nigeria',
                            onSave: (value) {
                              controller.country = value!;
                            },
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return 'you must write your country';
                              }
                            }),
                      ),
                    ]),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
