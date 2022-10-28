import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:my_app/constance.dart';

import '../categories/woman_products_view.dart';
import 'custom_text.dart';

class CustomButtonCategory extends StatelessWidget {
  late dynamic page;
  late String category_name;
  late String image;

  CustomButtonCategory(
      {super.key,
      required this.page,
      required this.category_name,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 25),
      child: InkWell(
        onTap: () {
          Get.to(page);
        },
        child: Container(
          child: Column(
            children: [
              Container(
                  width: 65,
                  height: 65,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.grey.shade100),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'assets/category_icons/$image.png',
                      color: primaryColor,
                    ),
                  )),
              const SizedBox(
                height: 10,
              ),
              CustomText(text: category_name, fontSize: 15),
            ],
          ),
        ),
      ),
    );
  }
}
