import 'dart:async';
import 'package:flutter/material.dart';
import 'package:frontendpsw/UI/Utils/Constants.dart';
import 'package:frontendpsw/UI/Utils/Top.dart';

import 'package:frontendpsw/UI/pages/ProductFromCategory.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';




class Shop extends StatefulWidget {
  final bool isLogged; 

  const Shop({Key? key, required this.isLogged}) : super(key: key);

  @override
  State<Shop> createState() => _ShopState(isLogged: isLogged); 
}

class _ShopState extends State<Shop> {
  final bool isLogged; 

  _ShopState({required this.isLogged}); 


  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 240, 240, 240),
        surfaceTintColor: Color.fromARGB(255, 240, 240, 240),
        actions: 
        getToken() == null ? 
          Top(context, false) : Top(context, true), 
      ), 
      body: LayoutBuilder(builder: (BuildContext context,BoxConstraints constraints){
        return SingleChildScrollView(
          child: ConstrainedBox(constraints: BoxConstraints(minHeight: constraints.maxHeight),
          child: Column(crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MySlideshow(),
            Container(height: 70,color: Colors.white,child:
            Center(
              child: Text(
                "Le nostre categorie",
                style: GoogleFonts.pacifico(color: Constants.blu, fontSize: 28),
              ),
            ),),
            Container(height: 30, color: Colors.white),
            Container(color:Colors.white, child: 
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(child: Column(children: [
                  Image.asset("assets/images/backpack.png", width: 200,height: 200,fit: BoxFit.cover,),
                  TextButton(onPressed: (){Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>  ProductsFromCategory(isLogged: isLogged,startingFilter:  "zaini e borsellini")),
                    );},
                  style: TextButton.styleFrom(
                    textStyle: GoogleFonts.fjallaOne(),
                    foregroundColor: Constants.blu,
                  ),
                  child: const Text(
                    'Zaini, borse \n e borsellini',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Container(height: 30, color: Colors.white),
                ],)),
                Expanded(child: Column(children: [
                  Image.asset("assets/images/banner-mob.png", width: 200,height: 200,fit: BoxFit.cover,),
                  TextButton(onPressed: (){Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>  ProductsFromCategory(isLogged: isLogged, startingFilter: "agende e calendari")),
                    );},
                  style: TextButton.styleFrom(
                    textStyle: GoogleFonts.fjallaOne(),
                    foregroundColor: Constants.blu,
                  ),
                  child: const Text(
                    'Agende e calendari',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                ],)) 
              ],
            ),),
            Container(color:Colors.white, child: 
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(child: Column(children: [
                  Image.asset("assets/images/cancelleria-696x464.jpg", width: 200,height: 200,fit: BoxFit.cover,),
                  TextButton(onPressed: (){Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ProductsFromCategory(isLogged: isLogged, startingFilter: "cancelleria")),
                    );},
                  style: TextButton.styleFrom(
                    textStyle: GoogleFonts.fjallaOne(),
                    foregroundColor: Constants.blu,
                  ),
                  child: const Text(
                    'Cancelleria e \n oggetti per ufficio',
                    style: TextStyle(fontSize: 20),
                  ),
                ),

                ],)),
                Expanded(child: Column(children: [
                  Image.asset("assets/images/regali-aziendali.jpg", width: 200,height: 200,fit: BoxFit.cover,),
                  TextButton(onPressed: (){Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ProductsFromCategory(isLogged: isLogged, startingFilter: "articoli da regalo"))
                    );},
                  style: TextButton.styleFrom(
                    textStyle: GoogleFonts.fjallaOne(),
                    foregroundColor: Constants.blu,
                  ),
                  child: const Text(
                    'Articoli da regalo',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                ],)) 
              ],
            ),),
            Container(height: 70, color: Colors.white),
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
                ),
                height: 350,
                child: Column(
                  children: [
                    Container(
                      color: Colors.white,
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
                    ))]))],),),
        );
      }),
      );
  }
  
  getToken() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString("token");
    print(token);
    return token;
  }
}



class MySlideshow extends StatefulWidget {
  @override
  _MySlideshowState createState() => _MySlideshowState();
}

class _MySlideshowState extends State<MySlideshow> {
  late PageController _pageController;
  int _currentPage = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _startTimer();
    
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 5), (timer) {
      if (_currentPage < _images.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  final List<String> _images = [
    'assets/images/9a6d55df768aecfb0a4b008d8295.jpg',
    'assets/images/cancelleria.png',
    'assets/images/hp_geografia.jpg',
    // Aggiungi altre immagini secondo necessità
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600, // Altezza desiderata della vetrina
      child: PageView.builder(
        controller: _pageController,
        itemCount: _images.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            child: Image.asset(
              _images[index],
              fit: BoxFit.cover,
            ),
          );
        },
        onPageChanged: (index) {
          setState(() {
            _currentPage = index;
          });
        },
      ),
    );
  }
}


     