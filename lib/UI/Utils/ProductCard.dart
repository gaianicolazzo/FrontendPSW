import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontendpsw/UI/Utils/Constants.dart';
import 'package:frontendpsw/model/Product.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ProductCard extends StatefulWidget {
  final Product product;

  ProductCard({required this.product}) : super();

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  int quantity = 1;
  
  

  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: Color.fromARGB(255, 240, 240, 240),
      shadowColor: Colors.black,
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Text(
              widget.product.name,
              style: GoogleFonts.fjallaOne(color: Colors.black, fontSize: 15),
            ),
            Text(
              widget.product.descr,
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            Text(
              "€"+widget.product.prize.toString(),
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
                          if(quantity<widget.product.availablePz)
                          quantity++;
                        });
                      },
                      icon: Icon(Icons.add),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {
                    Product productToAdd = Product(name: widget.product.name, barCode: widget.product.barCode, prize: widget.product.prize, availablePz: quantity, descr: widget.product.descr, color: widget.product.color, category: widget.product.category, brand: widget.product.brand);
                    addInCart(productToAdd);
                  },
                  icon: Icon(Icons.shopping_cart),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  
  addInCart(Product product) async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var jwtToken = sharedPreferences.getString("token");
    Map<String, String> headers = {"User-Agent" : "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36",
    "Content-Type":"application/json",
    'Authorization': 'Bearer $jwtToken'};
    

  var requestBody = productToJson(product); // Converti in JSON

  var url = Uri.http(Constants.ADDRESS_STORE_SERVER, Constants.REQUEST_ADD_PRODUCT_IN_CART);
  var res = await http.post(
    url,
    body: requestBody, // Usa il corpo della richiesta convertito in JSON
    headers: headers,
  );
  int statusCode = res.statusCode;
  print(statusCode);

  displayDialog(context, res.body);

  }
  
  void displayDialog(BuildContext context,  String text)=> showDialog(
      context: context,
      builder: (context) =>
        AlertDialog(
          content: Text(text)
        ),
    );
}
