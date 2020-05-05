import 'package:restaurant_app_with_ddd/application_layer/adapters/product_adapter.dart';
import 'package:restaurant_app_with_ddd/domain_layer/models/product_model.dart';

class ProductUserCase {
  Future<List<ProductModel>> getAllProducts() async {
    return await ProductService().getAll(ProductAdapterAPi());
  }
}