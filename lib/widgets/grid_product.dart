import 'package:flutter/material.dart';
import 'package:restaurant_app_with_ddd/screens/details.dart';
//import 'package:restaurant_app_with_ddd/util/const.dart';
//import 'package:restaurant_app_with_ddd/widgets/smooth_star_rating.dart';
import 'package:restaurant_app_with_ddd/domain_layer/models/product_model.dart';

class GridProduct extends StatelessWidget {
  final ProductModel product;
  final String img;
  final bool isFav;
  final double rating;
  final int raters;
  

  GridProduct(
      {Key key,
      @required this.product,
      @required this.img,
      this.isFav,
      this.rating,
      this.raters})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: ListView(
        shrinkWrap: true,
        primary: false,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height / 3.6,
                width: MediaQuery.of(context).size.width / 2.2,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    "$img",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              /*
              Positioned(
                right: -10.0,
                bottom: 3.0,
                child: RawMaterialButton(
                  onPressed: (){},
                  fillColor: Colors.white,
                  shape: CircleBorder(),
                  elevation: 4.0,
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Icon(
                      isFav
                          ?Icons.favorite
                          :Icons.favorite_border,
                      color: Colors.red,
                      size: 17,
                    ),
                  ),
                ),
              ),
              */
            ],
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 2.0, top: 8.0),
            child: Text(
              "${product.name}",
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.w900,
              ),
              maxLines: 2,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 5.0, top: 2.0),
            child: Row(
              children: <Widget>[
                /*
                SmoothStarRating(
                  starCount: 5,
                  color: Constants.ratingBG,
                  allowHalfRating: true,
                  rating: rating,
                  size: 10.0,
                ),
                
                Text(
                  " $rating ($raters Reviews)",
                  style: TextStyle(
                    fontSize: 11.0,
                  ),
                ),
                */
                Text(
                  " ${product.priceObjectValue.currency} ${product.priceObjectValue.price}",
                  style: TextStyle(
                    fontSize: 11.0,
                  ),
                ),
                SizedBox(width: 20.0),
              ],
            ),
          ),
        ],
      ),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) {
              return ProductDetails(
                  product:product);
            },
          ),
        );
      },
    );
  }
}
