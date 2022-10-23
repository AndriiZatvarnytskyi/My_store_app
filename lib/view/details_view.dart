import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/constance.dart';
import 'package:my_app/core/view_model/cart_view_model.dart';
import 'package:my_app/view/widgets/custom_bottom_button.dart';
import 'package:my_app/view/widgets/custom_button.dart';

import '../model/cart_product_model.dart';
import '../model/ptoduct_model.dart';
import 'widgets/custom_text.dart';

class DetailsView extends StatelessWidget {
  ProductModel model;
  DetailsView({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: EdgeInsets.only(top: 30),
          child: Column(
            children: [
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: 270,
                  child: Image.network(model.image, fit: BoxFit.cover)),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.all(18),
                    child: Column(
                      children: [
                        Container(
                          child: CustomText(
                            text: model.name,
                            fontSize: 26,
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              padding: EdgeInsets.all(13),
                              width: MediaQuery.of(context).size.width * .40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: Colors.grey)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(text: 'Size'),
                                  CustomText(text: model.sized)
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(13),
                              width: MediaQuery.of(context).size.width * .40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: Colors.grey)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(text: 'Color'),
                                  Container(
                                    height: 20,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(10),
                                      color: model.color,
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        CustomText(
                          text: 'Details',
                          fontSize: 20,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CustomText(
                          text: model.description,
                          fontSize: 18,
                          height: 2,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        CustomText(
                            text: 'PRICE', fontSize: 22, color: Colors.grey),
                        CustomText(
                          text: '\$' + model.price,
                          color: primaryColor,
                          fontSize: 18,
                        )
                      ],
                    ),
                    GetBuilder<CartViewModel>(
                        init: CartViewModel(),
                        builder: (controller) => CustomBottomButton(
                            text: 'ADD',
                            onPressed: () {
                              controller.addProduct(CartProductModel(
                                name: model.name,
                                image: model.image,
                                price: model.price,
                                quantity: 1,
                                productId: model.productId,
                              ));
                              ;
                            },
                            color: primaryColor))
                  ],
                ),
              )
            ],
          )),
    );
  }
}
