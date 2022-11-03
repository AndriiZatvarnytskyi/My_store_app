import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/model/ptoduct_model.dart';

import '../services/category_product_services.dart';

class GamingCategoryViewModel extends GetxController {
  List<ProductModel> get gamingProductModel => _gamingProductModel;
  final List<ProductModel> _gamingProductModel = [];
  ValueNotifier<bool> get loading => _loading;
  final ValueNotifier<bool> _loading = ValueNotifier(false);

  GamingCategoryViewModel() {
    getGamingProduct();
  }

  getGamingProduct() async {
    _loading.value = true;
    CategoryProductServices().getGamingCategory().then((value) {
      for (int i = 0; i < value.length; i++) {
        _gamingProductModel.add(
            ProductModel.fromJson(value[i].data() as Map<dynamic, dynamic>));
        _loading.value = false;
      }
      update();
    });
  }
}
