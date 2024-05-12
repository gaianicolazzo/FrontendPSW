import 'dart:convert';

import 'package:frontendpsw/model/Product.dart';

ProductInCart productInCartFromJson(String str) => ProductInCart.fromJson(json.decode(str));

String productInCartToJson(ProductInCart data) => json.encode(data.toJson());

List<ProductInCart> listProductInCartFromJson(String str) => List<ProductInCart>.from(json.decode(str).map((x) => ProductInCart.fromJson(x)));

String listproductInCartToJson(List<ProductInCart> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductInCart {
    double prize;
    Product product;
    int qty;
    

    ProductInCart({
        required this.prize,
        required this.product,
        required this.qty,
        
    });

    factory ProductInCart.fromJson(Map<String, dynamic> json) => ProductInCart(
        product: Product.fromJson(json['product']),
        qty: json['qty'],
        prize: json['prize'],
    );

    Map<String, dynamic> toJson() => {
        "product": productToJson(product),
        "qty": qty,
        "prize": prize,
        
    };
}