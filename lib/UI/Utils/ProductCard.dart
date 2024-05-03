import 'package:flutter/material.dart';
import 'package:frontendpsw/model/ListProducts.dart';

class ProductCard extends StatelessWidget {
  final Product product;


  ProductCard({required this.product}) : super();

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Text(
              product.name,
              style: TextStyle(
                fontSize: 40,
                color: Theme.of(context).primaryColor,
              ),
            ),
            Text(
              product.descr,
              style: TextStyle(
                color: Theme.of(context).primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }


}