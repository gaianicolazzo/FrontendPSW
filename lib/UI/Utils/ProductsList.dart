import 'package:flutter/material.dart';
import 'package:frontendpsw/UI/Utils/ProductCard.dart';
import 'package:frontendpsw/model/Product.dart';


class ProductList extends StatelessWidget {
  final List<Product> products;

  const ProductList({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return ProductCard(product: product);
      },
    );
  }
}
