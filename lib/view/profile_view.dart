import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/view/auth/login_view.dart';
import 'package:my_app/view/widgets/custom_text.dart';

import '../core/view_model/profile_view_model.dart';

class ProfoleView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileViewModel>(
      init: ProfileViewModel(),
      builder: (controller) => controller.loading.value
          ? Center(child: CircularProgressIndicator())
          : Scaffold(
              body: Container(
                padding: EdgeInsets.only(
                  top: 70,
                ),
                child: SingleChildScrollView(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                              width: 90,
                              height: 90,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(100)),
                                image: DecorationImage(
                                    image: NetworkImage(controller
                                        .userModel!.pic
                                        .toString()) as ImageProvider,
                                    fit: BoxFit.fill),
                              )),
                          Column(
                            children: [
                              CustomText(
                                text: controller.userModel!.name.toString(),
                                color: Colors.black,
                                fontSize: 25,
                              ),
                              CustomText(
                                text: controller.userModel!.email.toString(),
                                color: Colors.black,
                                fontSize: 20,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      child: TextButton(
                        onPressed: () {},
                        child: ListTile(
                          title: CustomText(
                            text: 'Edit Profile',
                          ),
                          leading: Image.asset(
                            'assets/menu_icons/pencil.png',
                            height: 25,
                            width: 25,
                          ),
                          trailing: Icon(
                            Icons.navigate_next,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: TextButton(
                        onPressed: () {},
                        child: ListTile(
                          title: CustomText(
                            text: 'Shopping Address',
                          ),
                          leading: Image.asset(
                            'assets/menu_icons/map_pointer.png',
                            height: 25,
                            width: 25,
                          ),
                          trailing: Icon(
                            Icons.navigate_next,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: TextButton(
                        onPressed: () {},
                        child: ListTile(
                          title: CustomText(
                            text: 'Order History',
                          ),
                          leading: Image.asset(
                            'assets/menu_icons/clock.png',
                            height: 25,
                            width: 25,
                          ),
                          trailing: Icon(
                            Icons.navigate_next,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: TextButton(
                        onPressed: () {},
                        child: ListTile(
                          title: CustomText(
                            text: 'Cards',
                          ),
                          leading: Image.asset(
                            'assets/menu_icons/credit_card.png',
                            height: 25,
                            width: 25,
                          ),
                          trailing: Icon(
                            Icons.navigate_next,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: TextButton(
                        onPressed: () {},
                        child: ListTile(
                          title: CustomText(
                            text: 'Notifications',
                          ),
                          leading: Image.asset(
                            'assets/menu_icons/bell.png',
                            height: 25,
                            width: 25,
                          ),
                          trailing: Icon(
                            Icons.navigate_next,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: TextButton(
                        onPressed: () {
                          controller.signOut();
                          Get.offAll(LoginView());
                        },
                        child: ListTile(
                          title: CustomText(
                            text: 'Log Out',
                          ),
                          leading: Image.asset(
                            'assets/menu_icons/log_out.png',
                            height: 25,
                            width: 25,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
              ),
            ),
    );
  }
}
