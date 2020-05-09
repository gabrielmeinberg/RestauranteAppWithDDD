import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app_with_ddd/domain_layer/models/order_model.dart';
import 'package:restaurant_app_with_ddd/domain_layer/models/product_model.dart';
import 'package:restaurant_app_with_ddd/providers/app_provider.dart';
import 'package:restaurant_app_with_ddd/screens/details_order.dart';

class OrderItem extends StatelessWidget {
  final OrderProduct orderItem;
  final String img;

  OrderItem({
    Key key,
    @required this.orderItem,
    @required this.img,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductModel product = Provider.of<AppProvider>(context)
        .foods
        .firstWhere((food) => food.id == orderItem.product);
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 4, 0, 4),
      child: InkWell(
        child: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 0.0, right: 10.0),
              child: Container(
                height: MediaQuery.of(context).size.width / 3.5,
                width: MediaQuery.of(context).size.width / 3,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    "$img",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  "${product.name}",
                  style: TextStyle(
//                    fontSize: 15,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(height: 10.0),
                Row(
                  children: <Widget>[
                    Text(
                      "${product.unit}",
                      style: TextStyle(
                        fontSize: 11.0,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Text(
                      "${product.priceObjectValue.currency} ${(orderItem.price * orderItem.quantity).toStringAsFixed(2)}",
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w900,
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Text(
                  "Quantidade: ${orderItem.quantity}",
                  style: TextStyle(
                    fontSize: 11.0,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
