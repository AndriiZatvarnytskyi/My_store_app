import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/view_model/auth_view_model.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Second page')
          // GetBuilder<AuthViewModel>(
          //     init: AuthViewModel(),
          //     builder: (value) => Text('${value.counter}')),
          // GetBuilder<AuthViewModel>(
          //   builder: (value) => TextButton(
          //       onPressed: () {
          //         value.increment();
          //       },
          //       child: Text('increment')),
          //)
        ],
      ),
    );
  }
}
