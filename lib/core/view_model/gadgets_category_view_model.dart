import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/model/ptoduct_model.dart';

import '../services/category_product_services.dart';

class GadgetCategoryViewModel extends GetxController {
  List<ProductModel> get gadgetProductModel => _gadgetProductModel;
  final List<ProductModel> _gadgetProductModel = [];
  ValueNotifier<bool> get loading => _loading;
  final ValueNotifier<bool> _loading = ValueNotifier(false);

  GadgetCategoryViewModel() {
    getGadgetProduct();
  }

  getGadgetProduct() async {
    _loading.value = true;
    CategoryProductServices().getGadgetsCategory().then((value) {
      for (int i = 0; i < value.length; i++) {
        _gadgetProductModel.add(
            ProductModel.fromJson(value[i].data() as Map<dynamic, dynamic>));
        _loading.value = false;
      }
      update();
    });
  }
}
