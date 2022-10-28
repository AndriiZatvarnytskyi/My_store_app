import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/constance.dart';
import '../../core/view_model/gadgets_category_view_model.dart';
import '../details_view.dart';
import '../widgets/custom_text.dart';

class GadgetProductsView extends StatelessWidget {
  const GadgetProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GadgetCategoryViewModel>(
      init: GadgetCategoryViewModel(),
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
                    Container(child: const Text('GADGETS')),
                  ],
                ),
              ),
              body: Container(
                padding: const EdgeInsets.all(20),
                child: ListView.separated(
                  scrollDirection: Axis.vertical,
                  itemCount: controller.gadgetProductModel.length,
                  itemBuilder: ((context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.to(DetailsView(
                            model: controller.gadgetProductModel[index]));
                      },
                      child: Container(
                        child: Row(
                          children: [
                            Container(
                                width: 170,
                                height: 200,
                                child: Image.network(
                                  controller.gadgetProductModel[index].image[0],
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
                                        .gadgetProductModel[index].name,
                                  ),
                                  CustomText(
                                    text: controller
                                            .gadgetProductModel[index].price
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
