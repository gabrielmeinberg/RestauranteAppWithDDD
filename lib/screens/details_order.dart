import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app_with_ddd/domain_layer/models/order_model.dart';
import 'package:restaurant_app_with_ddd/providers/app_provider.dart';
import 'package:restaurant_app_with_ddd/widgets/order_item.dart';
import 'package:restaurant_app_with_ddd/screens/main_screen.dart';

class DetailOrder extends StatefulWidget {
  final OrderModel orderModel;

  DetailOrder(this.orderModel);

  @override
  _DetailOrder createState() => _DetailOrder();
}

class _DetailOrder extends State<DetailOrder> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Detalhes de Pedidos",
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.w800,
          ),
        ),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            tooltip: "Voltar",
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
                  onPressed: () {
                    Navigator.pop(context);
                    Provider.of<AppProvider>(context, listen: false).updatePage(4);
                  },
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
              "Items",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
            ListView.builder(
              primary: false,
              shrinkWrap: true,
              itemCount: widget.orderModel.orderProducts == null ? 0 : widget.orderModel.orderProducts.length,
              itemBuilder: (BuildContext context, int index) {
                OrderProduct item = widget.orderModel.orderProducts[index];
                return OrderItem(
                  img: "assets/food1.jpeg",
                  orderItem: item,
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
                          "${widget.orderModel.total.toStringAsFixed(2)}",
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
                ],
              ),
            ],
          ),
          height: 130,
        ),
      ),
    );
  }
}
