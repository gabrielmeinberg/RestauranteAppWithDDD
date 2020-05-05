import 'package:restaurant_app_with_ddd/domain_layer/models/cart_model.dart';

abstract class OrderPort{
  Future<void> makeOrder(CartModel cart, int client);
}