import 'dart:convert';

import 'package:frontendpsw/model/ProductsInCart.dart';

List<Order> listOrderFromJson(String str) => List<Order>.from(json.decode(str).map((x) => Order.fromJson(x)));

String listOrderToJson(List<Order> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Order {
  String? date;
  List<ProductInCart>? addedProducts;

  Order({this.date, this.addedProducts});

  Order.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    if (json['addedProducts'] != null) {
      addedProducts = <ProductInCart>[];
      json['addedProducts'].forEach((v) {
        addedProducts!.add(new ProductInCart.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    if (this.addedProducts != null) {
      data['addedProducts'] =
          this.addedProducts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}




