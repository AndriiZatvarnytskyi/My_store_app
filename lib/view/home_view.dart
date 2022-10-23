import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/constance.dart';
import 'package:my_app/core/view_model/control_view_model.dart';
import 'package:my_app/core/view_model/home_view_model.dart';
import 'package:my_app/view/auth/login_view.dart';
import 'package:my_app/view/cart_view.dart';
import 'package:my_app/view/details_view.dart';
import 'package:my_app/view/profile_view.dart';
import 'package:my_app/view/widgets/custom_bottom_button.dart';
import 'package:my_app/view/widgets/custom_text.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: HomeViewModel(),
      builder: (controller) => controller.loading.value
          ? Center(
              child: CircularProgressIndicator(
              color: Color.fromRGBO(0, 197, 105, 1),
            ))
          : Scaffold(
              body: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(top: 100, left: 20, right: 20),
                child: Column(
                  children: [
                    _searchTextFormField(),
                    SizedBox(
                      height: 30,
                    ),
                    CustomText(
                      text: 'Categories',
                      fontSize: 18,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    _listViewCategory(),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text: 'Best Selling',
                          fontSize: 18,
                        ),
                        CustomText(
                          text: 'See all',
                          fontSize: 16,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    _listViewProducts(),
                    SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            )),
    );
  }

  Widget _listViewCategory() {
    return GetBuilder<HomeViewModel>(
      init: HomeViewModel(),
      builder: (controller) => Container(
        height: 100,
        child: ListView.separated(
          itemCount: controller.categoryModel.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: ((context, index) {
            return Column(
              children: [
                Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.grey.shade100),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:
                          Image.network(controller.categoryModel[index].image),
                    )),
                SizedBox(
                  height: 13,
                ),
                CustomText(
                    text: controller.categoryModel[index].name, fontSize: 13),
              ],
            );
          }),
          separatorBuilder: (context, index) => SizedBox(
            width: 20,
          ),
        ),
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
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.grey.shade100),
                              child: Container(
                                  height: 200,
                                  child: Image.network(
                                    controller.productModel[index].image,
                                    fit: BoxFit.cover,
                                  ))),
                          SizedBox(
                            height: 10,
                          ),
                          CustomText(
                            text: controller.productModel[index].name,
                            alignment: Alignment.bottomLeft,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              controller.productModel[index].description,
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                              maxLines: 1,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          CustomText(
                            text: controller.productModel[index].price
                                    .toString() +
                                ' \$',
                            alignment: Alignment.bottomLeft,
                            color: primaryColor,
                          ),
                        ],
                      ),
                    ),
                  );
                }),
                separatorBuilder: (context, index) => SizedBox(
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
      color: Colors.grey.shade200,
    ),
    child: TextFormField(
      decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(Icons.search, color: Colors.black)),
    ),
  );
}
