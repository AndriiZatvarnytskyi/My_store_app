import 'package:flutter/cupertino.dart';
import 'package:my_app/model/cart_product_model.dart';

class OrderModel {
  late String userId, dataTime;
  Address? address;
  late List<CartProductModel> products;

  OrderModel({
    required this.userId,
    required this.dataTime,
    required this.address,
    required this.products,
  });
  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return new OrderModel(
        userId: map['userId'] as String,
        dataTime: map['dataTime'] as String,
        address: map['address'] as Address,
        products: map['products'] as List<CartProductModel>);
  }

  Map<String, dynamic> toMap() {
    return {
      userId: this.userId,
      dataTime: this.dataTime,
      address: this.address,
      products: this.products,
    } as Map<String, dynamic>;
  }
}

class Address {
  late String street1, street2, city, state, country;

  Address({
    required this.street1,
    required this.street2,
    required this.city,
    required this.state,
    required this.country,
  });
  factory Address.fromMap(Map<String, dynamic> map) {
    return new Address(
        street1: map['street1'] as String,
        street2: map['street2'] as String,
        city: map['city'] as String,
        state: map['state'] as String,
        country: map['country'] as String);
  }

  Map<String, dynamic> toMap() {
    return {
      street1: this.street1,
      street2: this.street2,
      city: this.city,
      state: this.state,
      country: this.country,
    } as Map<String, dynamic>;
  }
}
