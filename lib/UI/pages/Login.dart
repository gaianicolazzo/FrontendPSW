import 'dart:async';
import 'dart:convert';

import 'package:frontendpsw/UI/pages/Admin.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:flutter/material.dart';
import 'package:frontendpsw/App.dart';
import 'package:frontendpsw/UI/Utils/Constants.dart';
import 'package:frontendpsw/model/Response.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final TextEditingController _usernameController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Constants.arancio,
      body: Center(child: Container( height: 600, width: 400,child: Card(color: Colors.white , shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(padding: EdgeInsets.all(8.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, 
        crossAxisAlignment: CrossAxisAlignment.center,
        children : [
            SizedBox(height: 40, width: 20,),
            Text("Log In", style: GoogleFonts.pacifico(color: Constants.arancio, fontSize: 30)),
            SizedBox(height: 100, width: 20,),
          Container(
            height: 70,
            width: 300,
            child: TextField(
            controller: _usernameController,
            decoration: InputDecoration(labelText: 'Email'),
          ),
          ),
          Container(
            height: 90,
            width: 300,
            child: TextField(
            controller: _passwordController,
            obscureText: true,
            decoration: InputDecoration(labelText: 'Password'),
          ),),
          FloatingActionButton(onPressed: () async {
            var username = _usernameController.text;
            var password = _passwordController.text;

            await attemptLogIn(username, password);
            
          } , child: Text("Enter"),
            backgroundColor: Constants.arancio,
            foregroundColor: Colors.white,),
          SizedBox(height: 110, width: 20,),
          TextButton(onPressed: (){Navigator.push(
              context,
              MaterialPageRoute(
              builder: (context) => SignUp(),
        ), 
      );    }, child: Text("Don't have an account? Sign up!", style: GoogleFonts.roboto(color: Colors.black, fontSize: 15,),),)
      ])))
    ))
    );
  }
  

  attemptLogIn(String email, String password) async{
    Map<String, String> headers = {"User-Agent" : "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36",
    "Content-Type":"application/json",};
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    final Map<String, dynamic> request = {
    "email": '$email',
    "password": '$password'
  };

  var requestBody = jsonEncode(request); // Converti in JSON

  var url = Uri.http(Constants.ADDRESS_STORE_SERVER, Constants.REQUEST_LOGIN);
  var res = await http.post(
    url,
    body: requestBody, // Usa il corpo della richiesta convertito in JSON
    headers: headers,
  );
  int statusCode = res.statusCode;

     Map<String, dynamic> decodedToken;
    if (statusCode == 200) {
      var response = jsonDecode(res.body);
      // Salva il token e il timestamp corrente nel SharedPreferences
      decodedToken = JwtDecoder.decode(response['access_token']);
      String token = response['access_token'];
      int expirationTime = decodedToken['exp'];
      int currentTimestamp = DateTime.now().millisecondsSinceEpoch;
      _prefs.setString("token", token);
      _prefs.setInt("token_expiration", expirationTime);

      // Avvia un Timer per controllare periodicamente se il token è scaduto
      Timer.periodic(Duration(seconds: 60), (timer) async {
        int savedExpirationTime = _prefs.getInt("token_expiration") ?? 0;
        int currentTimestamp = DateTime.now().millisecondsSinceEpoch;
        if (currentTimestamp > savedExpirationTime) {
          // Rimuovi il token dal SharedPreferences
          await _prefs.remove("token");
          await _prefs.remove("token_expiration");
          timer.cancel();
          Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage())); // Interrompi il Timer dopo aver rimosso il token
      }
    });
    

   
    // Estrarre informazioni dal token
    String role = decodedToken['role']; // ruolo
      if(role == "USER"){
      Navigator.push(
              context,
              MaterialPageRoute(
              builder: (context) => HomePage()
        ), 
      );   
    }else if(role == "ADMIN"){
      Navigator.push(
              context,
              MaterialPageRoute(
              builder: (context) => Admin()
        ), 
      );   
    }} else if(statusCode == 403){
      displayDialog(context, "An Error Occurred", "Email or Password aren't correct!");
    }

  }
  
  void displayDialog(BuildContext context, String title, String text)=> showDialog(
      context: context,
      builder: (context) =>
        AlertDialog(
          title: Text(title),
          content: Text(text)
        ),
    );
}

class SignUp extends StatefulWidget{
  SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  
  

  @override
  Widget build(BuildContext context) {
   return Scaffold(backgroundColor: Constants.arancio,
      body: Center(child: Container( height: 600, width: 400,child: Card(color: Colors.white , shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(padding: EdgeInsets.all(8.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, 
        crossAxisAlignment: CrossAxisAlignment.center,
        children : [
            SizedBox(height: 40, width: 20,),
            Text("Registration", style: GoogleFonts.pacifico(color: Constants.arancio, fontSize: 30)),
            SizedBox(height: 50, width: 20,),
          Container(
            height: 70,
            width: 300,
            child: TextField(
            controller: _usernameController,
            decoration: InputDecoration(labelText: 'Email'),
          ),
          ),
          Container(
            height: 70,
            width: 300,
            child: TextField(
            controller: _passwordController,
            obscureText: true,
            decoration: InputDecoration(labelText: 'Password'),
          ),),
          Container(
            height: 70,
            width: 300,
            child: TextField(
            controller: _firstNameController,
            decoration: InputDecoration(labelText: 'First name'),
          ),),
          Container(
            height: 70,
            width: 300,
            child: TextField(
            controller: _lastNameController,
            decoration: InputDecoration(labelText: 'Last name'),
          ),),
          SizedBox(height: 50, width: 20,),
          FloatingActionButton(onPressed: () async {
            var username = _usernameController.text;
            var password = _passwordController.text;
            var firstName =_firstNameController.text;
            var lastName = _lastNameController.text;

            await attempSignUp(username, password, firstName, lastName);
            
          } , child: Text("Submit"),
            backgroundColor: Constants.arancio,
            foregroundColor: Colors.white,),
      ])))
    ))
    );
  }
  
  attempSignUp(String username, String password, String firstName, String lastName) async {
     Map<String, String> headers = {"User-Agent" : "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36",
    "Content-Type":"application/json",};
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final Map<String, dynamic> request = {
    "email": '$username',
    "password": '$password',
    "firstName" : '$firstName',
    "lastName" : '$lastName'
  };

  var requestBody = jsonEncode(request); // Converti in JSON

  var url = Uri.http(Constants.ADDRESS_STORE_SERVER, Constants.REQUEST_REGISTRATION);
  var res = await http.post(
    url,
    body: requestBody, // Usa il corpo della richiesta convertito in JSON
    headers: headers,
  );
  int statusCode = res.statusCode;

    print("STATUS CODE REQUEST TO PAY " + statusCode.toString());
    print(res.reasonPhrase.toString());
    //print(res.body.toString());

    if (statusCode == 200) {
      Navigator.push(
              context,
              MaterialPageRoute(
              builder: (context) => Login()
        ), 
      );   
      } else {
        displayDialog(context, "An Error Occurred", "L'utente esiste già");
      }
      
  }

  
  void displayDialog(BuildContext context, String title, String text)=> showDialog(
      context: context,
      builder: (context) =>
        AlertDialog(
          title: Text(title),
          content: Text(text)
        ),
    );
}
