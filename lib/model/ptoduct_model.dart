import 'package:flutter/material.dart';
import 'package:my_app/helper/extenstion.dart';

class ProductModel {
  late String productId, name, description, sized, price;
  late List<String> image;
  late Color color;

  ProductModel(
      {required this.name,
      required this.image,
      required this.description,
      required this.color,
      required this.price,
      required this.sized,
      required this.productId});

  ProductModel.fromJson(Map<dynamic, dynamic> map) {
    if (map.isEmpty) {
      return;
    }
    name = map['name'];
    image = [
      map['image']['0'].toString(),
      map['image']['1'].toString(),
      map['image']['2'].toString()
    ];
    description = map['description'];
    color = HexColor.fromHex(map['color']);
    sized = map['sized'];
    price = map['price'];
    productId = map['productId'];
  }

  toJson() {
    return {
      'name': name,
      'image': image,
      'description': description,
      'color': color,
      'sized': sized,
      'price': price,
      'productId': productId,
    };
  }
}
