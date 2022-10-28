import 'package:get/get.dart';
import 'package:my_app/core/view_model/control_view_model.dart';
import 'package:my_app/helper/local_storage_data.dart';
import '../core/view_model/auth_view_model.dart';
import '../core/view_model/cart_view_model.dart';
import '../core/view_model/checkout_view_model.dart';
import '../core/view_model/gadgets_category_view_model.dart';
import '../core/view_model/gaming_category_view_model.dart';
import '../core/view_model/home_view_model.dart';
import '../core/view_model/man_category_view_model.dart';
import '../core/view_model/woman_category_view_model.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModel());
    Get.lazyPut(() => ControlViewModel());
    Get.lazyPut(() => HomeViewModel());
    Get.lazyPut(() => CartViewModel());
    Get.lazyPut(() => LocalStorageData());
    Get.lazyPut(() => CheckOutViewModel());
    Get.lazyPut(() => WomanCategoryViewModel());
    Get.lazyPut(() => ManCategoryViewModel());
    Get.lazyPut(() => GadgetCategoryViewModel());
    Get.lazyPut(() => GamingCategoryViewModel());
  }
}
