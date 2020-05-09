import 'package:restaurant_app_with_ddd/domain_layer/models/cart_model.dart';
import 'package:restaurant_app_with_ddd/domain_layer/ports/order_port.dart';

class OrderProduct {
  int id;
  int order;
  int product;
  double price;
  int quantity;

  double get total {
    return price * quantity;
  }
  

  OrderProduct({this.id, this.order, this.product, this.price, this.quantity});

  OrderProduct.fromMap(Map snapshot)
      : id = snapshot['id'] ?? '',
        order = snapshot['order'] ?? '',
        product = snapshot['product'] ?? '',
        price = snapshot['price'] ?? '',
        quantity = snapshot['quantity'] ?? '';
}

class OrderModel {
  int id;
  List<OrderProduct> orderProducts;

  OrderModel({
    this.id,
    this.orderProducts
  });

  double get total {
    double _total = 0.0;
    for (OrderProduct orderProduct in orderProducts){
      _total = _total + orderProduct.total;
    }

    return _total;
  }

  OrderModel.fromMap(Map snapshot, List<OrderProduct> orderProduct)
      : id = snapshot['id'] ?? '',
        orderProducts = orderProduct;

  Future<void> makeOrder(CartModel cart, OrderPort api) async {
    await api.makeOrder(cart, 1);
  }

  Future<List<OrderModel>> getOrders(OrderPort api) async {
    return await api.getOrders();
  }


}
