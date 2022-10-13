import 'package:flutter/material.dart';
import 'package:my_app/helper/extenstion.dart';

class ProductModel {
  late String name, image, description, sized, price;
  late Color color;

  ProductModel(
      {required this.name,
      required this.image,
      required this.description,
      required this.color,
      required this.price,
      required this.sized});

  ProductModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    name = map['name'];
    image = map['image'];
    description = map['description'];
    color = HexColor.fromHex(map['color']);
    sized = map['sized'];
    price = map['price'];
  }

  toJson() {
    return {
      'name': name,
      'image': image,
      'description': description,
      'color': color,
      'sized': sized,
      'price': price,
    };
  }
}
