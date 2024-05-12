import 'dart:developer';

import 'package:frontendpsw/UI/Utils/Constants.dart';
import 'package:frontendpsw/model/ListProducts.dart';
import 'package:frontendpsw/model/Order.dart';
import 'package:frontendpsw/model/Product.dart';
import 'package:frontendpsw/model/ProductsInCart.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';



class ProductService{

  Future<List<Product>?> getProducts() async{
    try {
      var url = Uri.http(Constants.ADDRESS_STORE_SERVER, Constants.REQUEST_PRODUCTS);
      var response = await http.get(url);
      if(response.statusCode==200){
        List<Product> _product = listProductFromJson(response.body);
        return _product;
      }
    } catch (e) {  
      log(e.toString());
    }
    return null;
  }

  Future<List<Product>?> getFilteredProducts(String category) async{
    try {
      final queryParameters = {
      "category" : category,
};
      var url = Uri.http(Constants.ADDRESS_STORE_SERVER, Constants.REQUEST_FILTERED_PRODUCTS,queryParameters);
      var response = await http.get(url);
      if(response.statusCode==200){
        List<Product> _product = listProductFromJson(response.body);
        return _product;
      }
    } catch (e) {  
      log(e.toString());
    }
    return null;
  }

  Future<List<ProductInCart>?> getProductsInCart() async{
    try{
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var jwtToken = sharedPreferences.getString("token");
    Map<String, String> headers = {"User-Agent" : "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36",
    "Content-Type":"application/json",
    'Authorization': 'Bearer $jwtToken'};
      var url = Uri.http(Constants.ADDRESS_STORE_SERVER, Constants.REQUEST_PRODUCTS_IN_CART);
      var response = await http.get(url, headers: headers);
      if(response.statusCode==200){
        List<ProductInCart> _product = listProductInCartFromJson(response.body);
        return _product;
      }
    } catch (e) {  
      log(e.toString());
    }
    return null;
    }

  Future<void> modifyProductQty(int qty, Product product) async {
  try{
    final queryParameters = {
      "qty" : '$qty',
    };
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      var jwtToken = sharedPreferences.getString("token");
      Map<String, String> headers = {"User-Agent" : "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36",
      "Content-Type":"application/json",
      'Authorization': 'Bearer $jwtToken'};
      var url = Uri.http(Constants.ADDRESS_STORE_SERVER, Constants.REQUEST_MODIFY_QTY, queryParameters);
      //var request = productToJson(product);
      var response = await http.post(url, headers: headers, );
      print(response.statusCode);
      print(response.body);
    } catch (e) {  
      log(e.toString());
    }
    }

  Future<void> removeProduct(Product product) async{
    try{
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      var jwtToken = sharedPreferences.getString("token");
      Map<String, String> headers = {"User-Agent" : "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36",
      "Content-Type":"application/json",
      'Authorization': 'Bearer $jwtToken'};
      var url = Uri.http(Constants.ADDRESS_STORE_SERVER, Constants.REQUEST_REMOVE_PRODUCTS_IN_CART);
      var request = productToJson(product);
      var response = await http.post(url, body: request, headers: headers, );
      
    } catch (e) {  
      log(e.toString());
    }
  }

  Future<String?> order() async{
    try{
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      var jwtToken = sharedPreferences.getString("token");
      Map<String, String> headers = {"User-Agent" : "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36",
      "Content-Type":"application/json",
      'Authorization': 'Bearer $jwtToken'};
      var url = Uri.http(Constants.ADDRESS_STORE_SERVER, Constants.REQUEST_ORDER);
      var response = await http.post(url, headers: headers, );
      
      return response.body;
    } catch (e) {  
      log(e.toString());
    }
    return null;
  }

  Future<List<Order>?> getOrdersList() async{
    try{
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      var jwtToken = sharedPreferences.getString("token");
      Map<String, String> headers = {"User-Agent" : "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36",
      "Content-Type":"application/json",
      'Authorization': 'Bearer $jwtToken'};
      var url = Uri.http(Constants.ADDRESS_STORE_SERVER, Constants.REQUEST_LIST_ORDERS);
      var response = await http.get(url, headers: headers, );
      if(response.statusCode==200){
        List<Order> ordini = listOrderFromJson(response.body);
        return ordini;
      }
    } catch (e) {  
      log(e.toString());
    }
    return null;
  }
}