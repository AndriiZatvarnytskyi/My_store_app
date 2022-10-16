import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/view/control_view.dart';

import 'core/view_model/cart_view_model.dart';
import 'helper/binding.dart';
import 'view/auth/login_view.dart';

Future
//void
    main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(CartViewModel());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialBinding: Binding(),
        home: Scaffold(
          body: ControlView(),
        ),
        theme: ThemeData(fontFamily: 'SourceSans'));
  }
}
