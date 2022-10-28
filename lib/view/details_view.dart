import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/constance.dart';
import 'package:my_app/core/view_model/cart_view_model.dart';
import 'package:my_app/view/widgets/custom_bottom_button.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
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
        padding: const EdgeInsets.only(
          top: 30,
        ),
        child: SlidingUpPanel(
            minHeight: MediaQuery.of(context).size.height * 0.4,
            maxHeight: MediaQuery.of(context).size.height * 0.7,
            slideDirection: SlideDirection.DOWN,
            backdropEnabled: true,
            panel: Container(
                child: PageView.builder(
              itemBuilder: (image, index) {
                return Container(
                  child: Image.network(model.image[index], fit: BoxFit.cover),
                );
              },
              itemCount: model.image.length,
            )),
            body: Container(
              alignment: Alignment.bottomCenter,
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.4,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Container(
                        padding: const EdgeInsets.all(18),
                        child: Column(
                          children: [
                            Container(
                              child: CustomText(
                                text: model.name,
                                fontSize: 26,
                              ),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(13),
                                  width:
                                      MediaQuery.of(context).size.width * .40,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(color: Colors.grey)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const CustomText(text: 'Size'),
                                      CustomText(text: model.sized)
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(13),
                                  width:
                                      MediaQuery.of(context).size.width * .40,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(color: Colors.grey)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const CustomText(text: 'Color'),
                                      Container(
                                        height: 20,
                                        width: 30,
                                        decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: model.color,
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            const CustomText(
                              text: 'Details',
                              fontSize: 20,
                            ),
                            const SizedBox(
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
                    padding:
                        const EdgeInsets.only(left: 30, right: 30, bottom: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            const CustomText(
                                text: 'PRICE',
                                fontSize: 22,
                                color: Colors.grey),
                            CustomText(
                              text: '\$${model.price}',
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
                                    image: model.image[0].toString(),
                                    price: model.price,
                                    quantity: 1,
                                    productId: model.productId,
                                  ));
                                  ;
                                },
                                color: primaryColor))
                      ],
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
