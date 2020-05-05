import 'package:restaurant_app_with_ddd/domain_layer/models/product_model.dart';

abstract class ProductPort{
  Future<List<ProductModel>> getProducts(int id);
}