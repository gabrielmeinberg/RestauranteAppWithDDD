import 'package:restaurant_app_with_ddd/application_layer/adapters/order_adapter.dart';
import 'package:restaurant_app_with_ddd/domain_layer/models/order_model.dart';

class OrderUseCase{

  Future<List<OrderModel>> getOrder() async {
    return await OrderModel().getOrders(OrderAdapter());
  }
}