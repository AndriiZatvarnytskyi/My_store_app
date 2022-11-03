import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/model/ptoduct_model.dart';

import '../services/category_product_services.dart';

class ManCategoryViewModel extends GetxController {
  List<ProductModel> get manProductModel => _manProductModel;
  final List<ProductModel> _manProductModel = [];
  ValueNotifier<bool> get loading => _loading;
  final ValueNotifier<bool> _loading = ValueNotifier(false);

  ManCategoryViewModel() {
    getManProduct();
  }

  getManProduct() async {
    _loading.value = true;
    CategoryProductServices().getManCategory().then((value) {
      for (int i = 0; i < value.length; i++) {
        _manProductModel.add(
            ProductModel.fromJson(value[i].data() as Map<dynamic, dynamic>));
        _loading.value = false;
      }
      update();
    });
  }
}
