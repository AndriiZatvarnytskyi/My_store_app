// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:my_app/constance.dart';
import 'package:my_app/core/view_model/cart_view_model.dart';
import 'package:my_app/view/checkout/checkout_view.dart';
import 'package:my_app/view/widgets/custom_bottom_button.dart';
import 'buy_stepper/buy_stepper_view.dart';
import 'widgets/custom_button.dart';
import 'widgets/custom_text.dart';

class CartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartViewModel>(
        init: CartViewModel(),
        builder: (controller) => Scaffold(
            body: controller.cartProductModel.length == 0
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/icons/empty_cart.svg',
                        width: 200,
                        height: 200,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomText(
                        text: 'Cart Empty',
                        color: Color.fromARGB(255, 12, 35, 66),
                        fontSize: 32,
                        alignment: Alignment.center,
                      )
                    ],
                  )
                : Column(
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(top: 15),
                          child: ListView.separated(
                            itemBuilder: (context, index) {
                              return Container(
                                  height: 120,
                                  child: Row(
                                    children: [
                                      Container(
                                          width: 120,
                                          child: Image.network(
                                              controller.cartProductModel[index]
                                                  .image,
                                              fit: BoxFit.cover)),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            CustomText(
                                              text: controller
                                                  .cartProductModel[index].name,
                                              fontSize: 18,
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            CustomText(
                                              text:
                                                  '\$ ${controller.cartProductModel[index].price.toString()}',
                                              color: primaryColor,
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Container(
                                              width: 140,
                                              color: Colors.grey.shade200,
                                              height: 40,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  GestureDetector(
                                                      onTap: () {
                                                        controller
                                                            .increaseQuantity(
                                                                index);
                                                      },
                                                      child: Icon(Icons.add,
                                                          color: Colors.black)),
                                                  SizedBox(
                                                    width: 20,
                                                  ),
                                                  CustomText(
                                                    alignment: Alignment.center,
                                                    fontSize: 20,
                                                    color: Colors.black,
                                                    text: controller
                                                        .cartProductModel[index]
                                                        .quantity
                                                        .toString(),
                                                  ),
                                                  SizedBox(
                                                    width: 20,
                                                  ),
                                                  GestureDetector(
                                                      onTap: () {
                                                        controller
                                                            .decreaseQuantity(
                                                                index);
                                                      },
                                                      child: Container(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  bottom: 15),
                                                          child: Icon(
                                                              Icons
                                                                  .minimize_sharp,
                                                              color: Colors
                                                                  .black)))
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ));
                            },
                            itemCount: controller.cartProductModel.length,
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return SizedBox(
                                height: 20,
                              );
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                CustomText(
                                    text: 'TOTAL',
                                    fontSize: 22,
                                    color: Colors.grey),
                                GetBuilder<CartViewModel>(
                                    init: CartViewModel(),
                                    builder: (controller) => CustomText(
                                          text: '\$ ${controller.totalPrice}',
                                          color: primaryColor,
                                          fontSize: 18,
                                        ))
                              ],
                            ),
                            CustomBottomButton(
                              text: 'CHECKOUT',
                              onPressed: () {
                                Get.to(BuyStepperView());
                              },
                              color: primaryColor,
                            )
                          ],
                        ),
                      )
                    ],
                  )));
  }
}
