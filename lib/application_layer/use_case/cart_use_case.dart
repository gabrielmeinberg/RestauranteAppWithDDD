import 'package:restaurant_app_with_ddd/application_layer/adapters/cart_adapter.dart';
import 'package:restaurant_app_with_ddd/application_layer/adapters/order_adapter.dart';
import 'package:restaurant_app_with_ddd/domain_layer/models/cart_model.dart';
import 'package:restaurant_app_with_ddd/domain_layer/models/order_model.dart';
import 'package:restaurant_app_with_ddd/domain_layer/models/product_model.dart';


class CartUserCase{
  Future<CartModel> getCart() async {
    return await CartModel().getCart(CartAdapter());
  }

  Future<CartItemModel> addItemCart(ProductModel product, int quantity) async {
    return await CartModel().addItemAtCart(product, quantity, CartAdapter());
  }

  Future<void> deleteItem(CartItemModel item) async {
    await CartModel().deleteItemAtCart(item, CartAdapter());
  }

  Future<void> makeOrder(CartModel cart) async{
    await OrderModel().makeOrder(cart, OrderAdapter());
    await CartModel().deleteCart(CartAdapter());
  }
}