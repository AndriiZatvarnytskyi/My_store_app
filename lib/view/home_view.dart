import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/constance.dart';
import 'package:my_app/core/view_model/home_view_model.dart';
import 'package:my_app/view/categories/man_products_view.dart';
import 'package:my_app/view/categories/woman_products_view.dart';
import 'package:my_app/view/details_view.dart';
import 'package:my_app/view/widgets/custom_button_category.dart';
import 'package:my_app/view/widgets/custom_text.dart';

import 'categories/gadgets_products_view.dart';
import 'categories/gaming_product_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: HomeViewModel(),
      builder: (controller) => controller.loading.value
          ? const Center(child: CircularProgressIndicator(color: primaryColor))
          : Scaffold(
              body: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
                child: Column(
                  children: [
                    _searchTextFormField(),
                    const SizedBox(
                      height: 30,
                    ),
                    const CustomText(
                      text: 'Categories',
                      fontSize: 18,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    _listViewCategory(),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        CustomText(
                          text: 'Best Selling',
                          fontSize: 18,
                        ),
                        CustomText(
                          text: 'See all',
                          fontSize: 16,
                          color: primaryColor,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    _listViewProducts(),
                    const SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            )),
    );
  }

  Widget _listViewCategory() {
    return Container(
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          CustomButtonCategory(
            page: const WomanProductsView(),
            category_name: 'Woman',
            image: 'woman',
          ),
          CustomButtonCategory(
            page: const ManProductsView(),
            category_name: 'Man',
            image: 'man',
          ),
          CustomButtonCategory(
            page: const GadgetProductsView(),
            category_name: 'Gadgets',
            image: 'gadgets',
          ),
          CustomButtonCategory(
            page: const GamingProductsView(),
            category_name: 'Gaming',
            image: 'gaming',
          ),
        ],
      ),
    );
  }

  Widget _listViewProducts() {
    return GetBuilder<HomeViewModel>(
        init: HomeViewModel(),
        builder: ((controller) => Container(
              height: 330,
              child: ListView.separated(
                itemCount: controller.productModel.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: ((context, index) {
                  return GestureDetector(
                    onTap: () {
                      Get.to(
                          DetailsView(model: controller.productModel[index]));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.38,
                      child: Column(
                        children: [
                          Container(
                              width: MediaQuery.of(context).size.width * 0.38,
                              child: Container(
                                  height: 200,
                                  child: Image.network(
                                    controller.productModel[index].image[0],
                                    fit: BoxFit.cover,
                                  ))),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                controller.productModel[index].name,
                                maxLines: 1,
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              controller.productModel[index].description,
                              style: const TextStyle(
                                color: Colors.grey,
                              ),
                              maxLines: 1,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomText(
                            text: '${controller.productModel[index].price} \$',
                            alignment: Alignment.bottomLeft,
                            color: primaryColor,
                          ),
                        ],
                      ),
                    ),
                  );
                }),
                separatorBuilder: (context, index) => const SizedBox(
                  width: 20,
                ),
              ),
            )));
  }
}

Widget _searchTextFormField() {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Colors.grey.shade100,
    ),
    child: TextFormField(
      decoration: const InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(Icons.search, color: Colors.black)),
    ),
  );
}
