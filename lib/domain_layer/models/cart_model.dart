import 'dart:async';
import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:restaurant_app_with_ddd/domain_layer/models/product_model.dart';
import 'package:restaurant_app_with_ddd/domain_layer/ports/cart_port.dart';
import 'package:restaurant_app_with_ddd/widgets/cart_item.dart';

class CartItemModel {
  int id;
  int productId;
  int quantity;

  CartItemModel(this.id, this.productId, this.quantity);

  CartItemModel.fromMap(Map snapshot)
    : id = snapshot['id'],
      productId = snapshot['product_id'],
      quantity = snapshot['quantity'];

  toJson(){
    return {
    "product": productId,
    "quantity": quantity
    };
  }
}

class CartModel {
  List<CartItemModel> cart;

  CartModel({this.cart});

  Future<CartModel> getCart(CartPort repository) async {
    return repository.getCart();
  }

  Future<CartItemModel> addItemAtCart(ProductModel product, int quantity, CartPort repository) async{
    CartItemModel item = await repository.getItemByProduct(product);
    if (item != null){
      return await repository.updateItem(item, item.quantity + quantity);
    }
    return await repository.addItem(product, quantity);
  }

  Future<void> deleteItemAtCart(CartItemModel item, CartPort repository) async {
    await repository.removeItemCart(item);
  }

  Future<void> deleteCart(CartPort repository) async {
    await repository.deleteTable();
  }

  toJson(){
     return this.cart.map((item) => item.toJson()).toList(); 
  }
}
