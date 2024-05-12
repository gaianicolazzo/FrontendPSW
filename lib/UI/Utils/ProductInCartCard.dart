import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontendpsw/model/ProductsInCart.dart';
import 'package:frontendpsw/model/services/ProductService.dart';
import 'package:google_fonts/google_fonts.dart';



class ProductInCartCard extends StatefulWidget {
  final ProductInCart product;
  final Function(ProductInCart) removeFromCart;

  ProductInCartCard({required this.product, required this.removeFromCart}) : super();

  @override
  _ProductInCartCardState createState() => _ProductInCartCardState();
}

class _ProductInCartCardState extends State<ProductInCartCard> {
  
  
  

  @override
  Widget build(BuildContext context) {
    int quantity = widget.product.qty;
    return Card(
      surfaceTintColor: Color.fromARGB(255, 240, 240, 240),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Text(
              widget.product.product.name,
              style: GoogleFonts.fjallaOne(color: Colors.black, fontSize: 15),
            ),
            Text(
              widget.product.product.descr,
              style: TextStyle(
                color: Colors.black,fontSize: 12
              ),
            ),
            Text(
              "\u20AC${widget.product.prize.toStringAsFixed(2)}",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          if (quantity > 1) {
                            quantity--;
                            widget.product.qty--;
                            ProductService().modifyProductQty(widget.product.qty, widget.product.product);
                          }
                        });
                      },
                      icon: Icon(Icons.remove),
                    ),
                    Text(
                      quantity.toString(),
                      style: TextStyle(fontSize: 20),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          if(quantity<widget.product.product.availablePz){
                          quantity++;
                          widget.product.qty++;
                          ProductService().modifyProductQty(widget.product.qty, widget.product.product);
                          }
                        });
                      },
                      icon: Icon(Icons.add),
                    ),
                  ],
                ),
              ],
            ),
            TextButton(onPressed: (){
              ProductService().removeProduct(widget.product.product);
              widget.removeFromCart(widget.product);
            }, child: Text("remove", style: TextStyle(color: Colors.black,decoration: TextDecoration.underline,  ),))
          ],
        ),
      ),
    );
  }
}