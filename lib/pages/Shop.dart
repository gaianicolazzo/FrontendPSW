import 'dart:async';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:frontendpsw/Utils/Constant.dart';
import 'package:frontendpsw/pages/Backpack.dart';
import 'package:frontendpsw/pages/Calendar.dart';
import 'package:frontendpsw/pages/Stationery.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:frontendpsw/pages/Cart.dart';
import 'package:frontendpsw/pages/Contacts.dart';
import 'package:frontendpsw/pages/Info.dart';
import 'package:frontendpsw/pages/Login.dart';

class Shop extends StatelessWidget {
  const Shop({super.key});


  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 240, 240, 240),
      flexibleSpace: Row(
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
                foregroundColor: arancio,
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
                foregroundColor: blu,
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
                foregroundColor: arancio,
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
              color:blu,
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Login()),
                );
              },
              icon: const Icon(Icons.login),
            ),
          ),
          const Expanded(flex : 1 ,child: PreferredSize(preferredSize: Size.fromHeight(20.0),
            child: Padding(
              padding: EdgeInsets.all(5.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Cerca...',
                  labelStyle: TextStyle(color:blu),
                  border: OutlineInputBorder(borderSide: BorderSide(color:arancio)),
                  focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: arancio), // Colore del bordo quando il TextField ha il focus
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: arancio), // Colore del bordo quando il TextField non ha il focus
                ),
                ),cursorColor: blu,
              ),
            ),
          ),),
          const Spacer(flex: 1),
          Expanded(
            child: ElevatedButton.icon(
              icon: const Icon(Icons.shopping_bag, color: blu),
              label: const Text("Carrello"),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
                  return Colors.white;
                }),
                foregroundColor: MaterialStateProperty.resolveWith<Color>((states) {
                  if (states.contains(MaterialState.pressed)) {
                    return blu;
                  }
                  return blu;
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
      ),
      ), 
      body: LayoutBuilder(builder: (BuildContext context,BoxConstraints constraints){
        return SingleChildScrollView(
          child: ConstrainedBox(constraints: BoxConstraints(minHeight: constraints.maxHeight),
          child: Column(crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MySlideshow(),
            Container(height: 20, color: Colors.white),
            Center(
              child: Text(
                "Le nostre categorie",
                style: GoogleFonts.pacifico(color: blu, fontSize: 30),
              ),
            ),
            Container(height: 20, color: Colors.white),
            Container(color:Colors.white, child: 
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(child: Column(children: [
                  Image.asset("assets/images/backpack.png", width: 200,height: 200,fit: BoxFit.cover,),
                  TextButton(onPressed: (){Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => const Backpack()),
                    );},
                  style: TextButton.styleFrom(
                    textStyle: GoogleFonts.fjallaOne(),
                    foregroundColor: blu,
                  ),
                  child: const Text(
                    'Zaini, borse \n e borsellini',
                    style: TextStyle(fontSize: 20),
                  ),
                ),

                ],)),
                Expanded(child: Column(children: [
                  Image.asset("assets/images/banner-mob.png", width: 200,height: 200,fit: BoxFit.contain,),
                  TextButton(onPressed: (){Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => const Calendar()),
                    );},
                  style: TextButton.styleFrom(
                    textStyle: GoogleFonts.fjallaOne(),
                    foregroundColor: blu,
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
                  Image.asset("assets/images/backpack.png", width: 200,height: 200,fit: BoxFit.cover,),
                  TextButton(onPressed: (){Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => const Stationery()),
                    );},
                  style: TextButton.styleFrom(
                    textStyle: GoogleFonts.fjallaOne(),
                    foregroundColor: blu,
                  ),
                  child: const Text(
                    'Cancelleria e \n oggetti per ufficio',
                    style: TextStyle(fontSize: 20),
                  ),
                ),

                ],)),
                Expanded(child: Column(children: [
                  Image.asset("assets/images/banner-mob.png", width: 200,height: 200,fit: BoxFit.contain,),
                  TextButton(onPressed: (){Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => const Calendar()),
                    );},
                  style: TextButton.styleFrom(
                    textStyle: GoogleFonts.fjallaOne(),
                    foregroundColor: blu,
                  ),
                  child: const Text(
                    'Agende e calendari',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                ],)) 
              ],
            ),),
          ],),),
        );
      }),
      );
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
            onTap: () {
              // Azioni da eseguire quando si fa clic sull'immagine
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Shop()),
              );
            },
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
