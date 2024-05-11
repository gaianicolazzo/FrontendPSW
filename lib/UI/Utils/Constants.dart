import 'package:flutter/material.dart';
class Constants{
  static final String APPTITLE='myCartoleria';
  static final Color arancio = Color.fromARGB(250, 241, 124, 1);
  static final Color blu = Color.fromARGB(250, 12, 85, 134);

  static final String ADDRESS_STORE_SERVER = "localhost:8080";
  

  static final String REQUEST_PRODUCTS = '/product';
  static final String REQUEST_FILTERED_PRODUCTS = '/product/filtered';
  static final String REQUEST_LOGIN = '/api/v1/auth/authenticate';
  static final String REQUEST_REGISTRATION = '/api/v1/auth/register';
  static final String REQUEST_ADDPRODUCT = '/admin/product';
  static final String REQUEST_ADDBRAND = '/admin/brand';
  static final String REQUEST_ADD_PRODUCT_IN_CART = '/cart/addProductInCart';
  static final String REQUEST_PRODUCTS_IN_CART = '/cart/productsInCart';

  static final String REQUEST_MODIFY_QTY = '/cart/addQty';
}