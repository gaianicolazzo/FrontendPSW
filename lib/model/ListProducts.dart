import 'dart:convert';



List<Product> productFromJson(String str) => List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
    String name;
    String barCode;
    double prize;
    int availablePz;
    DateTime creatData;
    String descr;
    String color;
    String category;
    dynamic brand;

    Product({
        required this.name,
        required this.barCode,
        required this.prize,
        required this.availablePz,
        required this.creatData,
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
        creatData: DateTime.parse(json["creatData"]),
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
        "creatData": creatData.toIso8601String(),
        "descr": descr,
        "color": color,
        "category": category,
        "brand": brand,
    };

 
}