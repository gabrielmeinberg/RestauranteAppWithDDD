import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app_with_ddd/domain_layer/models/cart_model.dart';
import 'package:restaurant_app_with_ddd/providers/app_provider.dart';
import 'package:restaurant_app_with_ddd/screens/checkout.dart';
import 'package:restaurant_app_with_ddd/util/foods.dart';
import 'package:restaurant_app_with_ddd/widgets/cart_item.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen>
    with AutomaticKeepAliveClientMixin<CartScreen> {
  @override
  Widget build(BuildContext context) {
    CartModel cart = Provider.of<AppProvider>(context).cart;
    super.build(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
        child: ListView.builder(
          itemCount: cart == null ? 0 : cart.cart.length,
          itemBuilder: (BuildContext context, int index) {
//                Food food = Food.fromJson(foods[index]);
            CartItemModel item = cart.cart[index];
//                print(foods);
//                print(foods.length);
            return CartItem(
              img: "assets/food1.jpeg",
              item: item,
            );
          },
        ),
      ),
      floatingActionButton: _getCheckout(context),
    );
  }

  Widget _getCheckout(BuildContext context) {
    CartModel cart = Provider.of<AppProvider>(context).cart;
    if (cart.cart.length != 0){
      return FloatingActionButton.extended(
          label: Text('Finalizar'),
          tooltip: "Checkout",
          icon: Icon(
            Icons.arrow_forward,
          ),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return Checkout();
                },
              ),
            );
          },
          heroTag: Object(),
        );}else{
          return Container();
        }
  }

  @override
  bool get wantKeepAlive => true;
}
