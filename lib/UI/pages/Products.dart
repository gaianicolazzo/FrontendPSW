import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontendpsw/UI/Utils/Constants.dart';
import 'package:frontendpsw/UI/Utils/ProductCard.dart';
import 'package:frontendpsw/UI/Utils/Top.dart';
import 'package:frontendpsw/model/ListProducts.dart';
import 'package:frontendpsw/model/services/ProductService.dart';
import 'package:google_fonts/google_fonts.dart';

class Products extends StatefulWidget{
  

  const Products( {super.key});

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products>{
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: Color.fromARGB(255, 240, 240, 240),
      actions: Top(context),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              Container( color: Colors.white,
              child: 
                  FilterBar(),
                ),],)
              )
          );}
      )
    );
  }
  
 
}



class FilterBar extends StatefulWidget{
  const FilterBar( {super.key});

  @override
  State<FilterBar> createState() => _FilterBarState();
}

class _FilterBarState extends State<FilterBar> {
  List<Product> _filteredProducts = [];

@override
   void initState(){
    super.initState();
    _getProducts();
   }

void _getProducts() async{
    _filteredProducts = (await ProductService().getProducts())!;
    Future.delayed(const Duration(seconds: 1)).then((value)=> setState(() {
    }));
   }

void _getFilteredProducts(String category) async{
    _filteredProducts = (await ProductService().getFilteredProducts(category))!;
    Future.delayed(const Duration(seconds: 1)).then((value)=> setState(() {
    }));
    
   }


  @override
  Widget build(BuildContext context) {
        return Row(mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center
          ,children: [ 
          SizedBox(
          height: MediaQuery.of(context).size.height,width: 200 , child: Drawer(backgroundColor: Colors.white,
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
                Text("Categoria", style: GoogleFonts.fjallaOne(color: Constants.blu, fontSize: 20),),
                ListTile(
                title: Text('Zaini', style: GoogleFonts.playfairDisplay(fontSize : 15),),
                onTap: () {
                  _getFilteredProducts("zaini");
                },
              ),
              ListTile(
                title: Text('Borse', style: GoogleFonts.playfairDisplay(fontSize : 15)),
                // Inserisci qui il valore della casella di spunta
                onTap: () {
                   _getFilteredProducts("borse");
                },
              ),
              ListTile(
                title: Text('Borsellini',style: GoogleFonts.playfairDisplay(fontSize : 15)),
                onTap: () {
                  _getFilteredProducts("borsellini");
                },
              ),ListTile(
                title: Text('Cancelleria', style: GoogleFonts.playfairDisplay(fontSize : 15)),
                onTap: () {
                  _getFilteredProducts("cancelleria");
                },
              ),ListTile(
                title: Text('Agende', style: GoogleFonts.playfairDisplay(fontSize : 15)),
                onTap: () {
                  _getFilteredProducts("agende");
                },
              ),ListTile(
                title: Text('Calendari',style: GoogleFonts.playfairDisplay(fontSize : 15)),
                onTap: () {
                  _getFilteredProducts("calendari");
                },
              ),
             ListTile(
                title: Text('Articoli da regalo',style: GoogleFonts.playfairDisplay(fontSize : 15)),
                onTap: () {
                  _getFilteredProducts("articoli da regalo");
                },
              ),
              ],
              ),)
        )]),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: _filteredProducts.isEmpty
                ? [const Center(child: CircularProgressIndicator())]
                : _filteredProducts
                    .map((product) => ProductCard(product: product))
                    .toList(),
          ),
        ),
      ],
    );
  }

  
}
