import "package:restaurant_app_with_ddd/domain_layer/models/cart_model.dart";
import 'package:restaurant_app_with_ddd/domain_layer/models/product_model.dart';

abstract class CartPort{
  Future<CartItemModel> addItem(ProductModel product, int quantity);
  Future<CartModel> getCart();
  Future<void> removeItemCart(CartItemModel item);
  Future<CartItemModel> getItemByProduct(ProductModel product);
  Future<CartItemModel> updateItem(CartItemModel item, int quantity);
  Future<void> deleteTable();
}