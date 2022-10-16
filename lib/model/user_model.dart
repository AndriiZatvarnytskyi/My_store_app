import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/view/cart_view.dart';

class UserModel {
  String? userId, email, name, pic;
  UserModel(
      {required this.userId,
      required this.email,
      required this.name,
      required this.pic});

  UserModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    userId = map['userId'];
    email = map['email'];
    name = map['name'];
    pic = map['pic'];
  }
  toJson() {
    return {
      'userId': userId,
      'email': email,
      'name': name,
      'pic': pic,
    };
  }
}
