import 'package:restaurant_app_with_ddd/domain_layer/models/product_model.dart';
import 'package:restaurant_app_with_ddd/domain_layer/ports/cart_port.dart';
import 'package:restaurant_app_with_ddd/domain_layer/models/cart_model.dart';
import 'package:restaurant_app_with_ddd/repository_layer/mysqlite.dart';

class CartAdapter extends CartPort {
  var db = CartDB();
  
  @override
  Future<CartItemModel> addItem(ProductModel product, int quantity) async {
    int id = await db.insertItem(product.id, quantity);
    return CartItemModel(id, product.id, quantity);
  }

  @override
  Future<CartModel> getCart() async {
    List<Map> cart = await db.getCart();
    List<CartItemModel> itemList =
        cart.map((item) => CartItemModel.fromMap(item)).toList();
    return CartModel(cart:itemList);
  }

  @override
  Future<void> removeItemCart(CartItemModel item) async {
    await db.deleteItem(item.id);
  }

  @override
  Future<CartItemModel> getItemByProduct(ProductModel product) async {
    Map itemMap = await db.getItem(product.id);
    if (itemMap != null){
      return CartItemModel.fromMap(itemMap);
    }
    return null;
  }

  @override
  Future<CartItemModel> updateItem(CartItemModel item, int quantity) async {
    var result = await db.updateItem(item.id, item.productId, quantity);
    if (result != null){
      return item;
    }
    return null;
  }

  @override
  Future<void> deleteTable() async {
    await db.deleteTable();
  }
}
