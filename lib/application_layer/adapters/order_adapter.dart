import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:restaurant_app_with_ddd/domain_layer/models/cart_model.dart';
import 'package:restaurant_app_with_ddd/domain_layer/models/order_model.dart';
import 'package:restaurant_app_with_ddd/domain_layer/ports/order_port.dart';

class OrderAdapter extends OrderPort {
  @override
  Future<void> makeOrder(CartModel cart, int client) async {
    Map jason = {"client": 1, "order_products": cart.toJson()};
    Map<String, String> headers = {
      "Content-type": "application/json",
      "Accept": "application/json",
    };
    final response = await http.post('http://ec2-35-175-235-153.compute-1.amazonaws.com/store/order/',
        headers: headers, body: json.encode(jason));
    if (response.statusCode != 201) {
      throw Exception('Failed to Make Order');
    }
  }

  Future<List<OrderModel>> getOrders() async {

    final response = await http.get('http://ec2-35-175-235-153.compute-1.amazonaws.com/store/order/');
    if (response.statusCode == 200) {

      List responseJson = json.decode(utf8.decode(response.bodyBytes)) as List;

      return responseJson.map((order) {
        List orderProducts = order['order_products'];
        List orderProductList = orderProducts.map((orderProduct) => OrderProduct.fromMap(orderProduct)).toList();
        return  OrderModel.fromMap(order, orderProductList);
      }).toList();

    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load Products');
    }
  }
}
