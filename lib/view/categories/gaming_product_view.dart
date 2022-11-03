import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/constance.dart';
import '../../core/view_model/gaming_category_view_model.dart';
import '../details_view.dart';
import '../widgets/custom_text.dart';

class GamingProductsView extends StatelessWidget {
  const GamingProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GamingCategoryViewModel>(
      init: GamingCategoryViewModel(),
      builder: (controller) => controller.loading.value
          ? const Center(child: CircularProgressIndicator(color: primaryColor))
          : Scaffold(
              appBar: AppBar(
                centerTitle: true,
                backgroundColor: primaryColor,
                title: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text('GAMING'),
                  ],
                ),
              ),
              body: Container(
                padding: const EdgeInsets.all(20),
                child: ListView.separated(
                  scrollDirection: Axis.vertical,
                  itemCount: controller.gamingProductModel.length,
                  itemBuilder: ((context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.to(DetailsView(
                            model: controller.gamingProductModel[index]));
                      },
                      child: Row(
                        children: [
                          SizedBox(
                              width: 170,
                              height: 200,
                              child: Image.network(
                                controller.gamingProductModel[index].image[0],
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText(
                                  fontSize: 21,
                                  text:
                                      controller.gamingProductModel[index].name,
                                ),
                                CustomText(
                                  text:
                                      '${controller.gamingProductModel[index].price} \$',
                                  fontSize: 27,
                                  color: primaryColor,
                                ),
                              ],
                            ),
                          ),
                        ],
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
