import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontendpsw/UI/Utils/ProductInCartCard.dart';
import 'package:frontendpsw/model/Order.dart';
import 'package:frontendpsw/model/ProductsInCart.dart';
import 'package:frontendpsw/model/services/ProductService.dart';
import 'package:google_fonts/google_fonts.dart';

class Cart extends StatefulWidget {
  bool isLogged;
  Cart({Key? key, required this.isLogged}) : super(key: key);
   
  @override
  State<Cart> createState() => _CartState();
}

  @override
  class _CartState extends State<Cart>{
    List<ProductInCart> _cartProducts =[];
    double totalPrize = 0;

  @override
   void initState(){
    super.initState();
    if(widget.isLogged){
      print(widget.isLogged);
      _getProducts();
    }
   }

   void _getProducts() async{
    _cartProducts = (await ProductService().getProductsInCart())!;
    totalPrize = _calculateTotalPrice();
    Future.delayed(const Duration(seconds: 1)).then((value)=> setState(() {
    }));
   }

    double _calculateTotalPrice() {
    double total = 0;
    for (var product in _cartProducts) {
      total += product.prize;
    }
    return total;}
      


   void removeFromCart(ProductInCart product) {
  setState(() {
    _cartProducts.remove(product);
    totalPrize = _calculateTotalPrice();
  });
}


  @override
Widget build(BuildContext context) {
  return Scaffold(
    body: widget.isLogged ? Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 50,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Text("My Cart", style: GoogleFonts.roboto(color: Colors.blueGrey, fontSize: 25)),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: _cartProducts.isEmpty
                      ? [const Center()]
                      : _cartProducts
                          .map((product) => ProductInCartCard(product: product, removeFromCart: removeFromCart))
                          .toList(),
                ),
              ],
            ),
            Container(height: 300,width: 400,
              child: Column(
                children: [
                  
                  Text("Order Summary", style: TextStyle(color: Colors.blueGrey, fontSize: 25)),
                  Text("Subtotal: \u20AC${totalPrize.toStringAsFixed(2)}"),
                  Text("Estimated delivery: \t \t 2-4 days", style: TextStyle(color: Colors.blueGrey),),
                  Spacer(flex: 2,),
                  Divider(thickness: 2, color: Colors.blueGrey,),
                  Text("Total \u20AC${totalPrize.toStringAsFixed(2)}", style: TextStyle(fontSize: 25),),
                  Row(mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [TextButton(onPressed: (){
                    makeOrder();
                  }, child: Text("Order", style: TextStyle(color: Colors.white, fontSize: 20),),style:TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0), // Imposta il raggio degli angoli
                    ),
                    backgroundColor: Colors.blueGrey, // Colore di sfondo del bottone
                  ),)],)

                ],
              ),
            ),
          ],
        ),
      ],
    ) : Container(alignment: Alignment.center,child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center
    ,children: [
      Text("Il carrello è vuoto! \n Accedi per visualizzare i tuoi prodotti.", style: GoogleFonts.fjallaOne(fontSize: 40),)
    ],))
  );
}

  void makeOrder() async{
    String? response = await ProductService().order();
    if(response=="true"){
      displayDialog(context, "L'ordine è andato a buon fine!", "Puoi visualizzarlo sul tuo profilo nella sezione 'ordini'");
    }
  }

   
  void displayDialog(BuildContext context, String title, String text)=> showDialog(
      context: context,
      builder: (context) =>
        AlertDialog(
          title: Text(title),
          content: Text(text)
        ),
    );


 
  }

