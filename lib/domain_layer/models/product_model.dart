import 'package:restaurant_app_with_ddd/domain_layer/ports/product_port.dart';

class ProductModel {
  int id;
  String name;
  String description;
  bool highlighted;
  PriceObjectValue priceObjectValue;
  String unit;

  ProductModel({
      this.name, this.description, this.highlighted, this.priceObjectValue});

  ProductModel.fromMap(Map snapshot, int id, PriceObjectValue price)
      : id = id ?? '',
        name = snapshot['name'] ?? '',
        description = snapshot['description'] ?? '',
        highlighted = snapshot['highlighted'] ?? '',
        priceObjectValue = price ?? PriceObjectValue(null, null),
        unit = snapshot['unit'] ?? '';

  toJson(){
    return {
      "name": name,
      "description": description,
      "highlighted": highlighted,
      "price": priceObjectValue.price,
      "currency": priceObjectValue.currency,
      "unit": unit
    };
  }
}

class PriceObjectValue {
  double price;
  String currency;

  PriceObjectValue(
      this.price, this.currency);

  PriceObjectValue.fromMap(Map snapshot)
  : price = snapshot['price'] ?? '',
    currency = snapshot['currency'] ?? '';
}

class ProductService {

  Future<List<ProductModel>> getAll(ProductPort adapter) async {
    return await adapter.getProducts(null);
  }
 
}