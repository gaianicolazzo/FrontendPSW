import 'package:flutter/material.dart';
import 'package:frontendpsw/UI/Utils/Constants.dart';
import 'package:frontendpsw/UI/Utils/ProductCard.dart';
import 'package:frontendpsw/UI/Utils/Top.dart';
import 'package:frontendpsw/model/Product.dart';
import 'package:frontendpsw/model/services/ProductService.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Products extends StatefulWidget {
  final bool isLogged; 

  const Products({Key? key, required this.isLogged}) : super(key: key);

  @override
  State<Products> createState() => _ProductsState(isLogged: isLogged); 
}

class _ProductsState extends State<Products> {
  final bool isLogged; 

  _ProductsState({required this.isLogged}); 


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
      backgroundColor: Color.fromARGB(255, 240, 240, 240),
      surfaceTintColor: Color.fromARGB(255, 240, 240, 240),
      elevation: 2,
      shadowColor: Colors.black,
      actions:
        Top(context, isLogged)
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
              Container( color: Color.fromARGB(255, 240, 240, 240),
              child: 
                   FilterBar(isLogged: isLogged),
                ),
                Container(
                decoration: BoxDecoration(color: Color.fromARGB(255, 240, 240, 240),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.8),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                height: 400,
                child: Column(
                  children: [
                    Container(
                      color: Color.fromARGB(255, 240, 240, 240),
                      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Spacer(flex: 1),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 120,
                                  width: 120,
                                  child: Image.asset(
                                    'assets/images/4212257.png',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                Text(
                                  '\n Spedizioni rapide',
                                  style: GoogleFonts.fjallaOne(color: Constants.arancio),),
                                Text(
                                  "\n La consegna avviene entro 1/5 giorni \n lavorativi con corriere all'indirizzo \n che inserirete in fase di pagamento.",
                                  style: GoogleFonts.fjallaOne(color: Colors.black,)
                                )], 
                                ),
                          ),Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(width: 30,height: 30,),
                                SizedBox(
                                  height: 100,
                                  width: 100,
                                  child: Image.asset(
                                    'assets/images/securitypayment.png',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                Text(
                                  '\n Pagamenti sicuri',
                                  style: GoogleFonts.fjallaOne(color: Constants.arancio),),
                                Text(
                                  '\n Sul nostro sito sono accettati i \n pagamenti con Bonifico Bancario\n e Paypal, con le principali carte di \n Credito accettate dal circuito:',
                                  style: GoogleFonts.fjallaOne(color: Colors.black)
                                )], 
                                )
                          ),Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(width: 30,height: 30,),
                                SizedBox(
                                  height: 100,
                                  width: 100,
                                  child: Image.asset(
                                    'assets/images/italy map.png',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                Text(
                                  '\n Spedizioni in tutta Italia',
                                  style: GoogleFonts.fjallaOne(color: Constants.arancio),),
                                Text(
                                  '\n Spediamo in tutta Italia, costi \n di spedizione calcolati in base a peso \n e dimensione del collo da spedire.',
                                  style: GoogleFonts.fjallaOne(color: Colors.black)
                                )], 
                                )
                          ),const Spacer(flex: 1), // Aggiunge spazio flessibile a destra
                          ],
                    ))
                ],)
              )
          ])));} 
      ),
    );
  }
  
  getToken() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString("token");
    print(token);
    return token;
  }
 
}



class FilterBar extends StatefulWidget{
  bool isLogged;
   FilterBar( {super.key, required this.isLogged});

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
          height: MediaQuery.of(context).size.height,width: 200 , child: Drawer(backgroundColor: Color.fromARGB(255, 240, 240, 240),surfaceTintColor: Colors.white,
          elevation: 16, shadowColor: Colors.black,shape: ContinuousRectangleBorder(),
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
                const SizedBox(height: 10,),
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
                    .map((product) => ProductCard(product: product, isLogged: widget.isLogged))
                    .toList(),
          ),
        ),
      ],
    );
  }

  
}
