import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app_with_ddd/domain_layer/models/cart_model.dart';
import 'package:restaurant_app_with_ddd/domain_layer/models/product_model.dart';
import 'package:restaurant_app_with_ddd/providers/app_provider.dart';
//import 'package:restaurant_app_with_ddd/screens/details.dart';
//import 'package:restaurant_app_with_ddd/util/const.dart';
//import 'package:restaurant_app_with_ddd/widgets/smooth_star_rating.dart';

class CartItem extends StatelessWidget {
  CartItemModel item;
  //final String name;
  final String img;
  //final bool isFav;
  //final double rating;
  //final int raters;

  CartItem({
    Key key,
    @required this.item,
    //@required this.name,
    @required this.img,
    //@required this.isFav,
    //@required this.rating,
    //@required this.raters
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ProductModel product = Provider.of<AppProvider>(context)
        .foods
        .firstWhere((food) => food.id == item.productId);
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
                /*
                Row(
                  children: <Widget>[
                    SmoothStarRating(
                      starCount: 1,
                      color: Constants.ratingBG,
                      allowHalfRating: true,
                      rating: 5.0,
                      size: 12.0,
                    ),
                    SizedBox(width: 6.0),
                    
                    Text(
                      "5.0 (23 Reviews)",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                */
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
                      "${product.priceObjectValue.currency} ${(product.priceObjectValue.price * item.quantity).toStringAsFixed(2)}",
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
                  "Quantidade: ${item.quantity}",
                  style: TextStyle(
                    fontSize: 11.0,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),

            Column(
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    Provider.of<AppProvider>(context, listen: false)
                        .deleteItemCart(item);
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
