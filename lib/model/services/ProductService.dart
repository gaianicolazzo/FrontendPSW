import 'dart:developer';

import 'package:frontendpsw/UI/Utils/Constants.dart';
import 'package:frontendpsw/model/ListProducts.dart';
import 'package:http/http.dart' as http;



class ProductService{

  Future<List<Product>?> getProducts() async{
    try {
      var url = Uri.http(Constants.ADDRESS_STORE_SERVER, Constants.REQUEST_PRODUCTS);
      var response = await http.get(url);
      if(response.statusCode==200){
        List<Product> _product = productFromJson(response.body);
        return _product;
      }
    } catch (e) {  
      log(e.toString());
    }
    return null;
  }
}