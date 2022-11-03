import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/view/control_view.dart';
import 'core/view_model/cart_view_model.dart';
import 'helper/binding.dart';


Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(CartViewModel());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialBinding: Binding(),
        home: const Scaffold(
          body: ControlView(),
        ),
        theme: ThemeData(
          fontFamily: 'SourceSans',
        ));
  }
}
