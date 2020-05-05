import 'package:restaurant_app_with_ddd/domain_layer/models/cart_model.dart';
import 'package:restaurant_app_with_ddd/domain_layer/ports/order_port.dart';

class OrderModel{
  Future<void> makeOrder(CartModel cart, OrderPort api) async{
    await api.makeOrder(cart, 1);
  }
}