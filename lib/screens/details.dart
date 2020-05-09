import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app_with_ddd/providers/app_provider.dart';
//import 'package:restaurant_app_with_ddd/screens/notifications.dart';
//import 'package:restaurant_app_with_ddd/util/comments.dart';
//import 'package:restaurant_app_with_ddd/util/const.dart';
import 'package:restaurant_app_with_ddd/util/foods.dart';
//import 'package:restaurant_app_with_ddd/widgets/badge.dart';
//import 'package:restaurant_app_with_ddd/widgets/smooth_star_rating.dart';
import 'package:restaurant_app_with_ddd/domain_layer/models/product_model.dart';

class ProductDetails extends StatefulWidget {
  final ProductModel product;

  ProductDetails({Key key, @required this.product}) : super(key: key);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  bool isFav = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            Icons.keyboard_backspace,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: Text(
          "Detalhes do Produto",
        ),
        elevation: 0.0,
        actions: <Widget>[
          /*
          IconButton(
            icon: IconBadge(
              icon: Icons.notifications,
              size: 22.0,
            ),
            onPressed: (){
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context){
                    return Notifications();
                  },
                ),
              );
            },
          ),
          */
        ],
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
        child: ListView(
          children: <Widget>[
            SizedBox(height: 10.0),
            Stack(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height / 3.2,
                  width: MediaQuery.of(context).size.width,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      "assets/food1.jpeg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  right: -10.0,
                  bottom: 3.0,
                  child: RawMaterialButton(
                    onPressed: () {},
                    fillColor: Colors.white,
                    shape: CircleBorder(),
                    elevation: 4.0,
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Icon(
                        isFav ? Icons.favorite : Icons.favorite_border,
                        color: Colors.red,
                        size: 17,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.0),
            Text(
              "${widget.product.name}",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
              maxLines: 2,
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
                    rating: 5.0,
                    size: 10.0,
                  ),
                  SizedBox(width: 10.0),

                  Text(
                    "5.0 (23 Reviews)",
                    style: TextStyle(
                      fontSize: 11.0,
                    ),
                  ),
                  */
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 5.0, top: 2.0),
              child: Row(
                children: <Widget>[
                  Text(
                    "${widget.product.unit}",
                    style: TextStyle(
                      fontSize: 11.0,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  SizedBox(width: 10.0),
                  Text(
                    "${widget.product.priceObjectValue.currency} ${widget.product.priceObjectValue.price}",
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w900,
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              "Descrição do Produto",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
              ),
              maxLines: 2,
            ),
            SizedBox(height: 10.0),
            Text(
              "${widget.product.description}",
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(height: 20.0),
            /*
            Text(
              "Reviews",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
              ),
              maxLines: 2,
            ),
            
            SizedBox(height: 20.0),

            ListView.builder(
              shrinkWrap: true,
              primary: false,
              physics: NeverScrollableScrollPhysics(),
              itemCount: comments == null?0:comments.length,
              itemBuilder: (BuildContext context, int index) {
                Map comment = comments[index];
                return ListTile(
                    leading: CircleAvatar(
                      radius: 25.0,
                      backgroundImage: AssetImage(
                        "${comment['img']}",
                      ),
                    ),

                    title: Text("${comment['name']}"),
                    subtitle: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            SmoothStarRating(
                              starCount: 5,
                              color: Constants.ratingBG,
                              allowHalfRating: true,
                              rating: 5.0,
                              size: 12.0,
                            ),
                            SizedBox(width: 6.0),
                            Text(
                              "February 14, 2020",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 7.0),
                        Text(
                          "${comment["comment"]}",
                        ),
                      ],
                    ),
                );
              },
            ),
            */
            SizedBox(height: 10.0),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 50.0,
        child: RaisedButton(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(Icons.add_shopping_cart),
              Text(
                "ADICIONAR CARRINHO",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
          color: Theme.of(context).accentColor,
          onPressed: () {
            Provider.of<AppProvider>(context, listen: false)
                .addItemCart(widget.product, 1);
            addCartConfirm(context);
          },
        ),
      ),
    );
  }

  addCartConfirm(BuildContext context) {
    Widget okButton = FlatButton(
      child: Text("Fechar"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    Widget goCart = FlatButton(
      child: Text("Carrinho de Compras"),
      onPressed: () {
        Navigator.pop(context);
        Navigator.pop(context);
        Provider.of<AppProvider>(context, listen: false).updatePage(3);
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text("Produto Adicionado ao Carrinho"),
      content: Text("Você Pode Finalizar a Compra no Carrinho de Compras"),
      actions: [goCart, okButton],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
