import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:restaurant_app_with_ddd/domain_layer/ports/product_port.dart';
import 'package:restaurant_app_with_ddd/domain_layer/models/product_model.dart';

class ProductAdapterAPi extends ProductPort {

  @override
  Future<List<ProductModel>> getProducts(int id) async{

    final response = await http.get('http://ec2-35-175-235-153.compute-1.amazonaws.com/store/product/');
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      List responseJson =  json.decode(utf8.decode(response.bodyBytes)) as List;
      return responseJson.map((product) {
       PriceObjectValue price = PriceObjectValue.fromMap(product);
       return ProductModel.fromMap(product, product['id'], price);
      }).toList();
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load Products');
    }
  }
}