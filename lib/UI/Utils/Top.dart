import 'package:flutter/material.dart';
import 'package:frontendpsw/UI/Utils/Constants.dart';
import 'package:frontendpsw/UI/pages/Cart.dart';
import 'package:frontendpsw/UI/pages/Contacts.dart';
import 'package:frontendpsw/UI/pages/Info.dart';
import 'package:frontendpsw/UI/pages/Login.dart';
import 'package:frontendpsw/UI/pages/Products.dart';
import 'package:frontendpsw/UI/pages/Profile.dart';
//import 'package:frontendpsw/UI/pages/Shop.dart';
import 'package:google_fonts/google_fonts.dart';

Top(BuildContext context, isLogged){ 
    return /* Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [*/
         <Widget>[
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  Products(isLogged: isLogged,)),
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
                Navigator.push(
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
                Navigator.push(
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
            child:
              !isLogged ?
                IconButton(
                  color:Constants.blu,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Login() ),
                    );
                  },
              icon: const Icon(Icons.account_circle_outlined),
            ) : IconButton(
                  color:Constants.blu,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Profile() ),
                    );
                  },
              icon: const Icon(Icons.account_circle_outlined),
          ),),
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Cart()),
                );
              },
            ),
          )
        ];}
      
      