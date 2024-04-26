import 'package:flutter/material.dart';
import 'package:frontendpsw/Utils/Constant.dart';
import 'package:frontendpsw/pages/Cart.dart';
import 'package:frontendpsw/pages/Contacts.dart';
import 'package:frontendpsw/pages/Info.dart';
import 'package:frontendpsw/pages/Login.dart';
import 'package:google_fonts/google_fonts.dart';

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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
            width: 50, // Lunghezza fissata
            height: 50, // Altezza fissata
            color: Colors.grey[300], // Colore di sfondo del container
            child: Image.asset(
              'assets/images/assets/images/brand-mycartoleria.jpg', // Percorso dell'immagine
              fit: BoxFit.cover, // Adatta l'immagine al container
            ),
          ),
            const MyButtonWithMenu(buttonText: "SHOP"),
            TextButton(onPressed: () { 
              Navigator.pushReplacement(
                context, 
                MaterialPageRoute(builder: (context) => const Info()),
                );
                } ,style: TextButton.styleFrom(textStyle: GoogleFonts.fjallaOne(), foregroundColor: Colors.black),child: const Text('CHI SIAMO', style: TextStyle(fontSize: 20),),),
                TextButton(onPressed: () { 
              Navigator.pushReplacement(
                context, 
                MaterialPageRoute(builder: (context) => const Contacts()),
                );
                } ,style: TextButton.styleFrom(textStyle: GoogleFonts.fjallaOne(), foregroundColor: Colors.black),child: const Text('CONTATTI'),),
                IconButton(onPressed: (){Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Login()));}, icon: const Icon(Icons.login)),
            ElevatedButton.icon(
              icon: const Icon(Icons.shopping_bag),
              label: const Text("Carrello"),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Cart()),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}


class MyButtonWithMenu extends StatefulWidget {
  final String buttonText;

  const MyButtonWithMenu({super.key, required this.buttonText});

  @override
  _MyButtonWithMenuState createState() => _MyButtonWithMenuState();
}

class _MyButtonWithMenuState extends State<MyButtonWithMenu> {


  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        final RenderBox button = context.findRenderObject() as RenderBox;
        final RenderBox overlay = Overlay.of(context).context.findRenderObject() as RenderBox;
        final Offset buttonTopLeft = button.localToGlobal(Offset.zero, ancestor: overlay);
        final double buttonWidth = button.size.width;
        final double overlayWidth = overlay.size.width;
        final double menuWidth = overlayWidth - buttonTopLeft.dx * 2 - buttonWidth;

        showMenu(
          context: context,
          position: RelativeRect.fromLTRB(buttonTopLeft.dx, buttonTopLeft.dy + button.size.height, buttonTopLeft.dx, 0),
          items: [
            PopupMenuItem(
              child: SizedBox(
                width: menuWidth,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Text('Opzione 1'),
                      onTap: () {
                        // Azioni da eseguire quando si seleziona Opzione 1
                      },
                    ),
                    ListTile(
                      title: Text('Opzione 2'),
                      onTap: () {
                        // Azioni da eseguire quando si seleziona Opzione 2
                      },
                    ),
                    ListTile(
                      title: Text('Opzione 3'),
                      onTap: () {
                        // Azioni da eseguire quando si seleziona Opzione 3
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
      child: TextButton(onPressed: () {  },style: TextButton.styleFrom(textStyle: GoogleFonts.fjallaOne(), foregroundColor: Colors.black),child: const Text('SHOP'),
        ),
    );
  }
}



     