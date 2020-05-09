import 'package:restaurant_app_with_ddd/domain_layer/models/cart_model.dart';
import 'package:restaurant_app_with_ddd/domain_layer/models/order_model.dart';

abstract class OrderPort{
  Future<void> makeOrder(CartModel cart, int client);
  Future<List<OrderModel>> getOrders();
}