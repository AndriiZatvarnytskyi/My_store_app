import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:my_app/constance.dart';
import 'package:my_app/core/view_model/cart_view_model.dart';
import 'package:my_app/view/widgets/custom_bottom_button.dart';
import 'buy_stepper/buy_stepper_view.dart';
import 'widgets/custom_text.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartViewModel>(
        init: CartViewModel(),
        builder: (controller) => Scaffold(
            body: controller.cartProductModel.isEmpty
                ? Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/empty_cart.svg',
                          width: 200,
                          height: 200,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const CustomText(
                          text: 'Cart Empty',
                          color: Color.fromARGB(255, 12, 35, 66),
                          fontSize: 32,
                          alignment: Alignment.center,
                        )
                      ],
                    ),
                  )
                : Column(
                    children: [
                      Expanded(
                        child: ListView.separated(
                          itemBuilder: (context, index) {
                            return Dismissible(
                              key: UniqueKey(),
                              background: Container(
                                alignment: AlignmentDirectional.centerStart,
                                color: Colors.red.shade400,
                                child: const Icon(Icons.delete_outline,
                                    color: Colors.white, size: 35),
                              ),
                              onDismissed: (direction) {
                                setState(() {
                                  controller.cartProductModel.removeAt(index);
                                });
                              },
                              direction: DismissDirection.startToEnd,
                              child: SizedBox(
                                  height: 150,
                                  child: Row(
                                    children: [
                                      SizedBox(
                                          height: 150,
                                          width: 135,
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
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            CustomText(
                                              text:
                                                  '\$ ${controller.cartProductModel[index].price.toString()}',
                                              color: primaryColor,
                                            ),
                                            const SizedBox(
                                              height: 50,
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
                                                      child: const Icon(
                                                          Icons.add,
                                                          color: Colors.black)),
                                                  const SizedBox(
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
                                                  const SizedBox(
                                                    width: 20,
                                                  ),
                                                  GestureDetector(
                                                      onTap: () {
                                                        if (controller
                                                                .cartProductModel[
                                                                    index]
                                                                .quantity >
                                                            1) {
                                                          controller
                                                              .decreaseQuantity(
                                                                  index);
                                                        }
                                                      },
                                                      child: Container(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  bottom: 15),
                                                          child: const Icon(
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
                                  )),
                            );
                          },
                          itemCount: controller.cartProductModel.length,
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(
                              height: 20,
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                const CustomText(
                                    text: 'TOTAL',
                                    fontSize: 22,
                                    color: Colors.grey),
                                GetBuilder<CartViewModel>(
                                    init: CartViewModel(),
                                    builder: (controller) => CustomText(
                                          text:
                                              '\$ ${controller.totalPrice.toStringAsFixed(2)}',
                                          color: primaryColor,
                                          fontSize: 18,
                                        ))
                              ],
                            ),
                            CustomBottomButton(
                              text: 'CHECKOUT',
                              onPressed: () {
                                Get.to(const BuyStepperView());
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
