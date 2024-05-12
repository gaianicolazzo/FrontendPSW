
import 'package:flutter/material.dart';
import 'package:frontendpsw/UI/Utils/Constants.dart';

import 'package:frontendpsw/UI/Utils/Top.dart';
import 'package:frontendpsw/model/Order.dart';
import 'package:frontendpsw/model/ProductsInCart.dart';
import 'package:frontendpsw/model/services/ProductService.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile extends StatefulWidget {
  final bool isLogged;

  Profile({super.key, required this.isLogged});


  @override
  State<Profile> createState() => _ProfileState();

}

@override
class _ProfileState extends State<Profile>{
  List<Order> _orders = [];

  void initState() {
    super.initState();
    getOrderList();
  }

  void getOrderList() async{
    _orders = (await ProductService().getOrdersList())!;
    Future.delayed(const Duration(seconds: 1)).then((value)=> setState(() {
    }));
  }

@override
Widget build(BuildContext context) {
  return Scaffold( backgroundColor: Color.fromARGB(255, 240, 240, 240),
    appBar: AppBar(backgroundColor: Color.fromARGB(255, 240, 240, 240),
      surfaceTintColor: Color.fromARGB(255, 240, 240, 240),actions: Top(context, widget.isLogged)),
    body: SingleChildScrollView(
      child: Center(child: Column(
        children: [
          Text(
              "Orders list",selectionColor: Constants.arancio,
              style: GoogleFonts.pacifico(color: Constants.blu, fontSize: 25,),
            ),
          Column(
            children: _orders.isEmpty
                ? [Center(child: Text('No orders'))]
                : _orders.map((order) => OrderCard(order: order)).toList(),
          ),
        ],
      ),
    )),
  );
}

  }  

  


class OrderCard extends StatelessWidget{
  final Order order;

  OrderCard({required this.order, super.key});



  @override
  Widget build(BuildContext context) {
    double totalPrize=0;
      for(ProductInCart pr in order.addedProducts!){
        totalPrize+= pr.prize*pr.qty; 
    }
    DateTime orderDate = DateTime.parse(order.date.toString());
    String dateWithoutTime = orderDate.toString().substring(0, 10);
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
            Text("Order date ${dateWithoutTime}", style: GoogleFonts.fjallaOne(fontSize: 20,color: Constants.arancio),),
            Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: order.addedProducts!.isEmpty
                      ? [const Center()]
                      : order.addedProducts!
                          .map((product) => ProductInOrderCard(product: product))
                          .toList(),
                ),
           Column(mainAxisAlignment: MainAxisAlignment.end,crossAxisAlignment: CrossAxisAlignment.end,children :[ Text("Total: \u20AC ${totalPrize.toStringAsFixed(2)}")]),
        ],),),
    );
  }
  }
  
  class ProductInOrderCard extends StatelessWidget{
    final ProductInCart product;


    ProductInOrderCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: Color.fromARGB(255, 240, 240, 240),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Text(
              product.product.name,
              style: GoogleFonts.fjallaOne(color: Colors.black, fontSize: 15),
            ),
            Text(
              product.product.descr,
              style: TextStyle(
                color: Colors.black,fontSize: 12
              ),
            ),
            Text(
              "${product.qty}",
              style: TextStyle(
                color: Colors.black,fontSize: 12
              ),
            ),
            Text(
              "\u20AC${product.prize.toStringAsFixed(2)}",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ],),));
  }

  }
  


