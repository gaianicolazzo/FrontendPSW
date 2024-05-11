import 'package:flutter/material.dart';
import 'package:frontendpsw/UI/Utils/ProductInCartCard.dart';
import 'package:frontendpsw/model/ProductsInCart.dart';
import 'package:frontendpsw/model/services/ProductService.dart';
import 'package:google_fonts/google_fonts.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);
   
  @override
  State<Cart> createState() => _CartState();
}

  @override
  class _CartState extends State<Cart>{
    List<ProductInCart> _cartProducts =[];

  @override
   void initState(){
    super.initState();
    _getProducts();
   }

   void _getProducts() async{
    _cartProducts = (await ProductService().getProductsInCart())!;
    Future.delayed(const Duration(seconds: 1)).then((value)=> setState(() {
    }));
   }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        body: Column(mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [ 
            Column(
              children : [ 
                Text("My Cart", style: GoogleFonts.roboto(color: Colors.black, fontSize: 25),),
                  Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: _cartProducts.isEmpty
                      ? [const Center(child: CircularProgressIndicator())]
                      : _cartProducts
                          .map((product) => ProductInCartCard(product: product))
                          .toList(),
        ),

                ]),

          ]
        )],),);
  }
  }

