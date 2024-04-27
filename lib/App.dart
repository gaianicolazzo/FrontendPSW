import 'package:flutter/material.dart';
import 'package:frontendpsw/pages/Shop.dart';
import 'package:frontendpsw/Utils/Constant.dart';
import 'package:frontendpsw/pages/Cart.dart';
import 'package:frontendpsw/pages/Contacts.dart';
import 'package:frontendpsw/pages/Info.dart';
import 'package:frontendpsw/pages/Login.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';

class App extends StatelessWidget {
  const App({super.key});



  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title : APPTITLE,
      home: HomePage(),
      );
  }

}


class HomePage extends StatelessWidget {
  const HomePage({super.key});

 @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      backgroundColor: Color.fromARGB(255, 240,240,240),
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
                foregroundColor: Color.fromARGB(250,241,124,1),
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
                foregroundColor: Color.fromARGB(250,12,85,134),
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
                foregroundColor: Color.fromARGB(250,241,124,1),
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
              color: Color.fromARGB(250,12,85,134),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Login()),
                );
              },
              icon: const Icon(Icons.login),
            ),
          ),
          Expanded(
            child: ElevatedButton.icon(
              icon: const Icon(Icons.shopping_bag, color: Color.fromARGB(250,12,85,134)),
              label: const Text("Carrello",),
              style: ButtonStyle(backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
      // Imposta il colore di sfondo del pulsante
              return Colors.white; // Colore di sfondo predefinito
    }),foregroundColor: MaterialStateProperty.resolveWith<Color>((states) {
      // Imposta il colore del testo in base allo stato del pulsante
      if (states.contains(MaterialState.pressed)) {
        // Colore del testo quando il pulsante è premuto
        return Color.fromARGB(250,12,85,134);
      }
      // Colore del testo predefinito
      return Color.fromARGB(250,12,85,134);
    }),),
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
    body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Spazio vuoto per separare l'app bar dalla vetrina di immagini
        const SizedBox(height: 2),
        // Vetrina di immagini
        MySlideshow()
      ],
    ),
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
              Navigator.push(
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






     