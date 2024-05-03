import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontendpsw/UI/Utils/Constants.dart';
import 'package:frontendpsw/model/ListProducts.dart';
import 'package:frontendpsw/UI/pages/Cart.dart';
import 'package:frontendpsw/UI/pages/Contacts.dart';
import 'package:frontendpsw/UI/pages/Info.dart';
import 'package:frontendpsw/UI/pages/Login.dart';
import 'package:frontendpsw/UI/pages/Shop.dart';
import 'package:frontendpsw/model/services/ProductService.dart';
import 'package:google_fonts/google_fonts.dart';

class Products extends StatefulWidget{
  

  const Products( {super.key});

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products>{
   late List<Product> _allproducts=[];

  @override
   void initState(){
    super.initState();
    _getProducts();
   }


   void _getProducts() async{
    _allproducts = (await ProductService().getProducts())!;
    Future.delayed(const Duration(seconds: 1)).then((value)=> setState(() {
    }));
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
      backgroundColor: Color.fromARGB(255, 240, 240, 240),
      flexibleSpace: top(context),
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        FilterBar(),
                ],),),
                  Container(
                  decoration: BoxDecoration(color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.8),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),),
                  Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: _allproducts == null || _allproducts!.isEmpty
                            ? [const Center(child: CircularProgressIndicator())]
                            : _allproducts!.map((product) => Card(
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(product.name),
                                        Text(product.prize.toString()),
                                      ],
                                    ),
                                  ],
                                ),
                              )).toList(),
                        )),
                ],),),
                ]),
              )
          );}
      )
    );
  }
  
 

  top(BuildContext context){ 
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              width: 50,
              height: 50,
              child: Image.asset(
                "assets/images/brand-mycartoleria.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Spacer(flex: 1),
          Expanded(
            flex: 1,
            child: TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Shop()),
                );
              },
              style: TextButton.styleFrom(
                textStyle: GoogleFonts.fjallaOne(),
                foregroundColor: Constants.arancio,
              ),
              child: const Text(
                'SHOP',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Info()),
                );
              },
              style: TextButton.styleFrom(
                textStyle: GoogleFonts.fjallaOne(),
                foregroundColor: Constants.blu,
              ),
              child: const Text(
                'CHI SIAMO',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Contacts()),
                );
              },
              style: TextButton.styleFrom(
                textStyle: GoogleFonts.fjallaOne(),
                foregroundColor: Constants.arancio,
              ),
              child: const Text(
                'CONTATTI',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: IconButton(
              color:Constants.blu,
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Login()),
                );
              },
              icon: const Icon(Icons.login),
            ),
          ),
          const Spacer(flex: 1),
          Expanded(
            child: ElevatedButton.icon(
              icon: Icon(Icons.shopping_bag, color: Constants.blu),
              label: const Text("Carrello"),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
                  return Colors.white;
                }),
                foregroundColor: MaterialStateProperty.resolveWith<Color>((states) {
                  if (states.contains(MaterialState.pressed)) {
                    return Constants.blu;
                  }
                  return Constants.blu;
                }),
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Cart()),
                );
              },
            ),
          )
        ],
      );}
      
      
}



class FilterBar extends StatefulWidget{
  const FilterBar({super.key});

  @override
  State<FilterBar> createState() => _FilterBarState();
}

class _FilterBarState extends State<FilterBar> {

  @override
  Widget build(BuildContext context) {
        return SizedBox(
          height: MediaQuery.of(context).size.height,width: MediaQuery.of(context).size.width , child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Constants.blu,
                ),
                child: Text(
                  'Filtri',
                  style: GoogleFonts.pacifico(color: Colors.black, fontSize: 24)
                ),
              ),
                Text("Categoria", style: GoogleFonts.fjallaOne(color: Colors.black, fontSize: 22),),
                CheckboxListTile(
                title: Text('Zaini', style: GoogleFonts.fjallaOne(),),
                value: false, // Inserisci qui il valore della casella di spunta
                onChanged: (bool? value) {
                  // Implementa l'azione per il cambio di stato della casella di spunta
                },
              ),
              CheckboxListTile(
                title: Text('Borse', style: GoogleFonts.fjallaOne()),
                value: false, // Inserisci qui il valore della casella di spunta
                onChanged: (bool? value) {
                  // Implementa l'azione per il cambio di stato della casella di spunta
                },
              ),
              CheckboxListTile(
                title: Text('Borsellini',style: GoogleFonts.fjallaOne()),
                value: false, // Inserisci qui il valore della casella di spunta
                onChanged: (bool? value) {
                  // Implementa l'azione per il cambio di stato della casella di spunta
                },
              ),CheckboxListTile(
                title: Text('Cancelleria', style: GoogleFonts.fjallaOne()),
                value: false, // Inserisci qui il valore della casella di spunta
                onChanged: (bool? value) {
                  // Implementa l'azione per il cambio di stato della casella di spunta
                },
              ),CheckboxListTile(
                title: Text('Agende', style: GoogleFonts.fjallaOne()),
                value: false, // Inserisci qui il valore della casella di spunta
                onChanged: (bool? value) {
                  // Implementa l'azione per il cambio di stato della casella di spunta
                },
              ),CheckboxListTile(
                title: Text('Calendari',style: GoogleFonts.fjallaOne()),
                value: false, // Inserisci qui il valore della casella di spunta
                onChanged: (bool? value) {
                  // Implementa l'azione per il cambio di stato della casella di spunta
                },
              ),
              CheckboxListTile(
                title: Text('Articoli da regalo',style: GoogleFonts.fjallaOne()),
                value: false, // Inserisci qui il valore della casella di spunta
                onChanged: (bool? value) {
                  // Implementa l'azione per il cambio di stato della casella di spunta
                },
              ),
              Text("Colore", style: GoogleFonts.fjallaOne(fontSize: 22),),
              CheckboxListTile(
                title: Row(children: [Text('Rosso',style: GoogleFonts.fjallaOne()), const Icon(Icons.square_sharp, color: Colors.red,)],),
                value: false, // Inserisci qui il valore della casella di spunta
                onChanged: (bool? value) {
                  // Implementa l'azione per il cambio di stato della casella di spunta
                },
              ),
              CheckboxListTile(
                title: Row(children: [Text('Giallo',style: GoogleFonts.fjallaOne()), const Icon(Icons.square_sharp, color: Colors.yellow,)],),
                value: false, // Inserisci qui il valore della casella di spunta
                onChanged: (bool? value) {
                  // Implementa l'azione per il cambio di stato della casella di spunta
                },
              ),
              CheckboxListTile(
                title: Row(children: [Text('Verde',style: GoogleFonts.fjallaOne()), const Icon(Icons.square_sharp, color: Colors.green,)],),
                value: false, // Inserisci qui il valore della casella di spunta
                onChanged: (bool? value) {
                  // Implementa l'azione per il cambio di stato della casella di spunta
                },
              ),
              CheckboxListTile(
                title: Row(children: [Text('Blu',style: GoogleFonts.fjallaOne()), const Icon(Icons.square_sharp, color: Colors.blue,)],),
                value: false, // Inserisci qui il valore della casella di spunta
                onChanged: (bool? value) {
                  // Implementa l'azione per il cambio di stato della casella di spunta
                },
              ),
              CheckboxListTile(
                title: Row(children: [Text('Nero',style: GoogleFonts.fjallaOne()), const Icon(Icons.square_sharp, color: Colors.black,)],),
                value: false, // Inserisci qui il valore della casella di spunta
                onChanged: (bool? value) {
                  // Implementa l'azione per il cambio di stato della casella di spunta
                },
              ),
              CheckboxListTile(
                title: Row(children: [Text('Arancio',style: GoogleFonts.fjallaOne()), const Icon(Icons.square_sharp, color: Colors.orange,)],),
                value: false, // Inserisci qui il valore della casella di spunta
                onChanged: (bool? value) {
                  // Implementa l'azione per il cambio di stato della casella di spunta
                },
              ),
              CheckboxListTile(
                title: Row(children: [Text('Marrone',style: GoogleFonts.fjallaOne()), const Icon(Icons.square_sharp, color: Colors.brown,)],),
                value: false, // Inserisci qui il valore della casella di spunta
                onChanged: (bool? value) {
                  // Implementa l'azione per il cambio di stato della casella di spunta
                },
              ),
              ],
              ),)
        );
  }
}
