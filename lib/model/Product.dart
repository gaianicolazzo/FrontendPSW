import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
    String name;
    String barCode;
    double prize;
    int availablePz;
    String descr;
    String color;
    String category;
    dynamic brand;

    Product({
        required this.name,
        required this.barCode,
        required this.prize,
        required this.availablePz,
        required this.descr,
        required this.color,
        required this.category,
        required this.brand,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        name: json["name"],
        barCode: json["barCode"],
        prize: json["prize"],
        availablePz: json["availablePz"],
        descr: json["descr"],
        color: json["color"],
        category: json["category"],
        brand: json["brand"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "barCode": barCode,
        "prize": prize,
        "availablePz": availablePz,
        "descr": descr,
        "color": color,
        "category": category,
        "brand": brand,
    };
}