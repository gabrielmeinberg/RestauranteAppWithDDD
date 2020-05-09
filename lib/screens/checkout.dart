import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app_with_ddd/domain_layer/models/cart_model.dart';
import 'package:restaurant_app_with_ddd/domain_layer/models/product_model.dart';
import 'package:restaurant_app_with_ddd/providers/app_provider.dart';
import 'package:restaurant_app_with_ddd/util/foods.dart';
import 'package:restaurant_app_with_ddd/widgets/cart_item.dart';

class Checkout extends StatefulWidget {
  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  final TextEditingController _couponlControl = new TextEditingController();
  String dropdownValue;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    CartModel cart = Provider.of<AppProvider>(context).cart;
    double getTotal() {
      double total = 0;

      for (CartItemModel i in cart.cart) {
        ProductModel product = Provider.of<AppProvider>(context)
            .foods
            .firstWhere((food) => food.id == i.productId);
        total = total + i.quantity * product.priceObjectValue.price;
      }

      return total;
    }
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Checkout",
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.w800,
          ),
        ),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            tooltip: "Back",
            icon: Icon(
              Icons.clear,
              color: Theme.of(context).accentColor,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 130),
        child: ListView(
          children: <Widget>[
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Endereço de Entrega",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.edit,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.0),
            ListTile(
              title: Text(
                "John Doe",
                style: TextStyle(
//                    fontSize: 15,
                  fontWeight: FontWeight.w900,
                ),
              ),
              subtitle: Text("1278 Loving Acres Road Kansas City, MO 64110"),
            ),
            SizedBox(height: 10.0),
            Text(
              "Método de Pagamento",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
            DropdownButton<String>(
              value: dropdownValue,
              icon: Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 16,
              onChanged: (String newValue) {
                setState(() {
                  dropdownValue = newValue;
                });
              },
              items: <String>['Cartão', 'Dinheiro']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            /*
            Card(
              elevation: 4.0,
              child: ListTile(
                title: Text("John Doe"),
                subtitle: Text(
                  "5506 7744 8610 9638",
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                leading: Icon(
                  FontAwesomeIcons.creditCard,
                  size: 50.0,
                  color: Theme.of(context).accentColor,
                ),
                trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.keyboard_arrow_down,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            */
            Text(
              "Items",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
            ListView.builder(
              primary: false,
              shrinkWrap: true,
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
          ],
        ),
      ),
      bottomSheet: Card(
        elevation: 4.0,
        child: Container(
          child: ListView(
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              /*
              Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.all(
                      Radius.circular(5.0),
                    ),
                  ),
                  child: TextField(
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(
                          color: Colors.grey[200],
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey[200],
                        ),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      hintText: "Coupon Code",
                      prefixIcon: Icon(
                        Icons.redeem,
                        color: Theme.of(context).accentColor,
                      ),
                      hintStyle: TextStyle(
                        fontSize: 15.0,
                        color: Colors.black,
                      ),
                    ),
                    maxLines: 1,
                    controller: _couponlControl,
                  ),
                ),
              ),
              */
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 5, 5, 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Total",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          "${getTotal()}",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w900,
                            color: Theme.of(context).accentColor,
                          ),
                        ),
                        Text(
                          "Custo de Entrega Incluido",
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(5, 5, 10, 5),
                    width: 150.0,
                    height: 50.0,
                    child: FlatButton(
                      color: Theme.of(context).accentColor,
                      child: Text(
                        "Confirmar Pedido".toUpperCase(),
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {
                        checkoutConfirm(context, cart);
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
          height: 130,
        ),
      ),
    );
  }

  checkoutConfirm(BuildContext context, CartModel cart) {
    Widget okButton = FlatButton(
      child: Text("Fechar"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    Widget goCart = FlatButton(
      child: Text("Confirmar"),
      onPressed: () {
        Navigator.pop(context);
        Navigator.pop(context);
        Provider.of<AppProvider>(context, listen: false).makeOrder(cart);
        Provider.of<AppProvider>(context, listen: false).updatePage(0);
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text("Finalizar Pedido"),
      content: Text("Você confirmar Pedido (Conferiu endereço?)"),
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
