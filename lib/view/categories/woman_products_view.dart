import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/constance.dart';

import '../../core/view_model/woman_category_view_model.dart';

import '../details_view.dart';
import '../widgets/custom_text.dart';

class WomanProductsView extends StatelessWidget {
  const WomanProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WomanCategoryViewModel>(
      init: WomanCategoryViewModel(),
      builder: (controller) => controller.loading.value
          ? const Center(child: CircularProgressIndicator(color: primaryColor))
          : Scaffold(
              appBar: AppBar(
                centerTitle: true,
                backgroundColor: primaryColor,
                title: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(child: const Text('WOMAN')),
                  ],
                ),
              ),
              body: Container(
                padding: const EdgeInsets.all(20),
                child: ListView.separated(
                  scrollDirection: Axis.vertical,
                  itemCount: controller.womanProductModel.length,
                  itemBuilder: ((context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.to(DetailsView(
                            model: controller.womanProductModel[index]));
                      },
                      child: Container(
                        child: Row(
                          children: [
                            Container(
                                width: 170,
                                height: 200,
                                child: Image.network(
                                  controller.womanProductModel[index].image[0],
                                  fit: BoxFit.cover,
                                )),
                            const SizedBox(
                              width: 20,
                            ),
                            Container(
                              height: 200,
                              width: 150,
                              padding: const EdgeInsets.only(bottom: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(
                                    fontSize: 21,
                                    text: controller
                                        .womanProductModel[index].name,
                                  ),
                                  CustomText(
                                    text: controller
                                            .womanProductModel[index].price
                                            .toString() +
                                        ' \$',
                                    fontSize: 27,
                                    color: primaryColor,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 20,
                  ),
                ),
              )),
    );
  }
}
