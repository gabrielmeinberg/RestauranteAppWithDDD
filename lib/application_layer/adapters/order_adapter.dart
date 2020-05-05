import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:restaurant_app_with_ddd/domain_layer/models/cart_model.dart';
import 'package:restaurant_app_with_ddd/domain_layer/ports/order_port.dart';

class OrderAdapter extends OrderPort {
  @override
  Future<void> makeOrder(CartModel cart, int client) async {
    Map jason = {"client": 1, "order_products": cart.toJson()};
    Map<String, String> headers = {
                "Content-type": "application/json",
                "Accept": "application/json",
              };
    final response =
        await http.post('http://ec2-35-175-235-153.compute-1.amazonaws.com/store/order/', headers: headers, body:json.encode(jason));
    if (response.statusCode != 201) {
      throw Exception('Failed to Make Order');
    }
  }
}
