import 'package:flutter/material.dart';
import 'package:frontendpsw/UI/Utils/Constants.dart';
import 'package:google_fonts/google_fonts.dart';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          child: Column(children: [
            SizedBox(height: 100,),
            Text("Login", style: GoogleFonts.pacifico(
              fontWeight : FontWeight.bold,
              fontSize: 50,
              color: Constants.blu,
              
            ),),
          ],),),));
  }
}
