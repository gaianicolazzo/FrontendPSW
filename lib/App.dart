import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontendpsw/UI/Utils/Top.dart';
import 'package:frontendpsw/UI/pages/Shop.dart';
import 'package:frontendpsw/UI/Utils/Constants.dart';

import 'package:google_fonts/google_fonts.dart';
import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class App extends StatelessWidget {
  const App({super.key});



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title : Constants.APPTITLE,
      home: HomePage(),
      );
  }

}


class HomePage extends StatefulWidget with  WidgetsBindingObserver{

  
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver {
  bool _isLoggedOut = false;


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
    _checkTokenExpiration();
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused && !_isLoggedOut) {
      _logout();
    }
  }

  void _checkTokenExpiration() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? expirationTime = prefs.getInt("token_expiration");
    if (expirationTime != null && DateTime.now().compareTo(DateTime.parse(expirationTime.toString()))> 1) {
      _logout();
    } else if(expirationTime == null){
      setState(() {
      _isLoggedOut = true;
    });
    }else{
      _isLoggedOut= false;
    }
  }

  void _logout() async {
    // Esegui il logout
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove("token");
    await prefs.remove("token_expiration");
    setState(() {
      _isLoggedOut = true;
    });
  }


 @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      backgroundColor: Color.fromARGB(255, 240, 240, 240),
      surfaceTintColor: Color.fromARGB(255, 240, 240, 240),
      actions: Top(context, !_isLoggedOut),
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
              const SizedBox(height: 2),
              MySlideshow(),
              const SizedBox(height: 20),
              Container( color: Colors.white,child: 
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'La tua cartoleria online per la scuola e il tempo libero', 
                          style: GoogleFonts.pacifico(color:Constants.blu,fontSize: 20),
                        ),
                        Text(
                          '\n\n Acquista online e ricevi la merce comodamente a casa.\n Sei della provincia di Catanzaro? Azzera i costi di spedizione. \n Scegli il "ritiro in negozio".',
                          style: GoogleFonts.fjallaOne(color: Constants.blu,),
                        ),
                        const SizedBox(height: 20),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Shop(isLogged: !_isLoggedOut,)),
                            );
                          },
                          style: TextButton.styleFrom(
                            textStyle: GoogleFonts.fjallaOne(),
                            foregroundColor: Constants.arancio,
                          ),
                          child: const Text(
                            'Scopri i nostri prodotti',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 50.0),
                      child: SizedBox(
                        height: 600,
                        width: 400,
                        child: Image.asset('assets/images/cartoleria.jpg', fit: BoxFit.contain),
                      ),
                    ),
                  ),
                ],
              ),),
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
                height: 400,
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
                    ))]
            )),]
      ,),),
  );}));}
  
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


     