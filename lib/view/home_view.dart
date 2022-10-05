import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/view/auth/login_screen.dart';

class HomeView extends StatelessWidget {
  FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home screen')),
      body: TextButton(
        child: Text('Logout'),
        onPressed: (() {
          _auth.signOut();
          Get.offAll(LoginScreen());
        }),
      ),
    );
  }
}
