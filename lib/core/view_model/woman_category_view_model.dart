import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/model/ptoduct_model.dart';

import '../services/category_product_services.dart';

class WomanCategoryViewModel extends GetxController {
  List<ProductModel> get womanProductModel => _womanProductModel;
  List<ProductModel> _womanProductModel = [];
  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);

  WomanCategoryViewModel() {
    getWomanProduct();
  }

  getWomanProduct() async {
    _loading.value = true;
    CategoryProductServices().getWomanCategory().then((value) {
      for (int i = 0; i < value.length; i++) {
        _womanProductModel.add(
            ProductModel.fromJson(value[i].data() as Map<dynamic, dynamic>));
        _loading.value = false;
      }
      update();
    });
  }
}
