import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontendpsw/UI/Utils/Constants.dart';

import 'package:frontendpsw/model/Product.dart';

import 'package:http/http.dart' as http;

import 'package:google_fonts/google_fonts.dart';

class Admin extends StatefulWidget {
  const Admin({Key? key});

  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  String operation = "";
  String selectedOperation = "";

  @override
  Widget build( BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Constants.blu,
       actions: <Widget>[ 
          OperationsBar(
            onOperationSelected: (selectedOp) {
              setState(() {
                selectedOperation = selectedOp;
              });
            },
          ),]),
        body : LayoutBuilder(builder: (BuildContext context,BoxConstraints constraints){
            return SingleChildScrollView(
           child: 
           _buildOperationScreen(),);}),
    );
  }

  Widget _buildOperationScreen() { 
    switch (selectedOperation) {
      case "prodotto":
        return AggiungiProdottoScreen();
      case "brand":
        return const AggiungiBrandScreen();
      default:
        return const SizedBox();
    }
  }
}

class AggiungiBrandScreen extends StatefulWidget {
  const AggiungiBrandScreen({Key? super.key});

  @override
  State<AggiungiBrandScreen> createState() => _AggiungiBrandScreenState();
}

class _AggiungiBrandScreenState extends State<AggiungiBrandScreen> {
  final TextEditingController _nomeBrandController = TextEditingController();
  


  @override
  Widget build(BuildContext context) {
    return Center(child: Column(mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,children: [
          Container(
            height: 70,
            width: 300,
            child: TextField(
            controller: _nomeBrandController,
            decoration: InputDecoration(labelText: 'Nome Prodotto',focusColor: Colors.black, hoverColor: Colors.black),
          ),
          ),
          FloatingActionButton(onPressed: () async {
            var nomeBrand = _nomeBrandController.text;
            

            await attemptInsertion(nomeBrand);
            
          } , child: Text("Enter"),
            backgroundColor: Constants.blu,
            foregroundColor: Colors.white,),
          ],));
  }
  
  attemptInsertion(String nomeBrand) async {
    Map<String, String> headers = {"User-Agent" : "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36",
    "Content-Type":"application/json",};
    
    

    var url = Uri.http(Constants.ADDRESS_STORE_SERVER, Constants.REQUEST_ADDBRAND);
    var res = await http.post(
    url,
    body: nomeBrand, 
    headers: headers,
  );
  int statusCode = res.statusCode;

    print("STATUS CODE REQUEST TO PAY " + statusCode.toString());

    if (statusCode == 200) {
      displayDialog(context, "Successo!", "Il brand è stato correttamente aggiunto");
      } else {
        displayDialog(context, "An Error Occurred", "Il brand esiste già");
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


class AggiungiProdottoScreen extends StatefulWidget {
  const AggiungiProdottoScreen({Key? key});

  @override
  State<AggiungiProdottoScreen> createState() => _AggiungiProdottoScreenState();
}

class _AggiungiProdottoScreenState extends State<AggiungiProdottoScreen> {

  final TextEditingController _nomeProdottoController = TextEditingController();
  final TextEditingController _barCodeController = TextEditingController();
  final TextEditingController _prezzoController = TextEditingController();
  final TextEditingController _numPezziController = TextEditingController();
  final TextEditingController _descrizioneController = TextEditingController();
  final TextEditingController _coloreController = TextEditingController();
  final TextEditingController _categoriaController = TextEditingController();
  final TextEditingController _brandController = TextEditingController();




  @override
  Widget build(BuildContext context) {
    return Center(child: Column(mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,children: [
          Container(
            height: 70,
            width: 300,
            child: TextField(
            controller: _nomeProdottoController,
            decoration: InputDecoration(labelText: 'Nome Prodotto',focusColor: Colors.black, hoverColor: Colors.black),
          ),
          ),
          Container(
            height: 70,
            width: 300,
            child: TextField(
            controller: _barCodeController ,
            decoration: InputDecoration(labelText: 'Barcode'),
          ),),
          Container(
            height: 70,
            width: 300,
            child: TextField(
            controller: _prezzoController,
            decoration: InputDecoration(labelText: 'Prezzo'),
          ),
          ),
          Container(
            height: 70,
            width: 300,
            child: TextField(
            controller: _numPezziController ,
            decoration: InputDecoration(labelText: 'Numero pezzi'),
          ),),
          Container(
            height: 70,
            width: 300,
            child: TextField(
            controller: _descrizioneController,
            decoration: InputDecoration(labelText: 'Descrizione'),
          ),
          ),
          Container(
            height: 70,
            width: 300,
            child: TextField(
            controller: _coloreController,
            decoration: InputDecoration(labelText: 'Colore'),
          ),),
          Container(
            height: 70,
            width: 300,
            child: TextField(
            controller: _categoriaController,
            decoration: InputDecoration(labelText: 'Categoria'),
          ),
          ),
          Container(
            height: 70,
            width: 300,
            child: TextField(
            controller: _brandController,
            decoration: InputDecoration(labelText: 'Brand'),
          ),),
          FloatingActionButton(onPressed: () async {
            var nomeProdotto = _nomeProdottoController.text;
            var barCode = _barCodeController.text;
            var prezzo = _prezzoController.text;
            var numPezzi = _numPezziController.text;
            var descr = _descrizioneController.text;
            var colore = _coloreController.text;
            var categoria = _categoriaController.text;
            var brand = _brandController.text;

            await attemptInsertion(nomeProdotto, barCode,prezzo, numPezzi,descr,colore,categoria,brand);
            // Svuota i TextField
            _nomeProdottoController.clear();
            _barCodeController.clear();
            _prezzoController.clear();
            _numPezziController.clear();
            _descrizioneController.clear();
            _coloreController.clear();
            _categoriaController.clear();
            _brandController.clear();

          } , child: Text("Enter"),
            backgroundColor: Constants.blu,
            foregroundColor: Colors.white,),
          ],));
  }
  
  attemptInsertion(String nomeProdotto, String barCode, String prezzo, String numPezzi, String descr, String colore, String categoria, String brand) async {
    Map<String, String> headers = {"User-Agent" : "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36",
    "Content-Type":"application/json",};
    Product product = Product(name: nomeProdotto, barCode: barCode, prize: double.parse(prezzo), availablePz: int.parse(numPezzi), descr: descr, color: colore, category: categoria, brand: brand);
    var request = productToJson(product);

    var url = Uri.http(Constants.ADDRESS_STORE_SERVER, Constants.REQUEST_ADDPRODUCT);
    var res = await http.post(
    url,
    body: request, // Usa il corpo della richiesta convertito in JSON
    headers: headers,
  );
  int statusCode = res.statusCode;

    print("STATUS CODE REQUEST TO PAY " + statusCode.toString());

    if (statusCode == 200) {
      displayDialog(context, "Successo!", "Il prodotto è stato correttamente aggiunto");
      } else {
        displayDialog(context, "An Error Occurred", "Il prodotto esiste già");
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

    
     
class OperationsBar extends StatefulWidget {
  final void Function(String) onOperationSelected;

  const OperationsBar({Key? key, required this.onOperationSelected}) : super(key: key);

  @override
  State<OperationsBar> createState() => _OperationsBarState();
}

class _OperationsBarState extends State<OperationsBar> {
  String operation = "";

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
     crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            widget.onOperationSelected("prodotto");
          },
          child: Text('Aggiungi nuovo prodotto', style: GoogleFonts.roboto(color: Colors.black), selectionColor: Colors.white,),
        ),
        ElevatedButton(
          onPressed: () {
            widget.onOperationSelected("brand");
          },
          child: Text('Aggiungi nuovo brand', style: GoogleFonts.roboto(color: Colors.black), selectionColor: Colors.white,),
        ),
      ],));
  }
}
