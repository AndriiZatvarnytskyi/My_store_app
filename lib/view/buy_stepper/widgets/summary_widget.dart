import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/constance.dart';
import 'package:my_app/core/view_model/cart_view_model.dart';
import 'package:my_app/core/view_model/checkout_view_model.dart';
import 'package:my_app/view/widgets/custom_text.dart';

class Summary extends StatelessWidget {
  const Summary({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GetBuilder<CartViewModel>(
        init: CartViewModel(),
        builder: (controller) => SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 40,
              ),
              Container(
                  padding: const EdgeInsets.all(20),
                  height: 350,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => SizedBox(
                      width: 150,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 150,
                            height: 180,
                            child: Image.network(
                              controller.cartProductModel[index].image,
                              fit: BoxFit.cover,
                            ),
                          ),
                          RichText(
                              maxLines: 1,
                              textAlign: TextAlign.start,
                              text: TextSpan(
                                  style: const TextStyle(color: Colors.black),
                                  text:
                                      controller.cartProductModel[index].name)),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomText(
                            alignment: Alignment.bottomLeft,
                            text:
                                '\$ ${controller.cartProductModel[index].price.toString()}',
                            color: primaryColor,
                          ),
                        ],
                      ),
                    ),
                    itemCount: controller.cartProductModel.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        width: 15,
                      );
                    },
                  )),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: CustomText(
                  text: 'Shipping Addres',
                  fontSize: 24,
                ),
              ),
              GetBuilder<CheckOutViewModel>(
                  init: CheckOutViewModel(),
                  builder: (controller) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomText(
                          fontSize: 24,
                          color: Colors.grey,
                          text:
                              '${controller.street1}, ${controller.street2}, ${controller.state}, ${controller.city}, ${controller.country}',
                        ),
                      ))
            ],
          ),
        ),
      ),
    );
  }
}
