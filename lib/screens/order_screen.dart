import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app_with_ddd/domain_layer/models/order_model.dart';
import 'package:restaurant_app_with_ddd/providers/app_provider.dart';
import 'package:restaurant_app_with_ddd/widgets/grid_order.dart';

class OrderScreen extends StatefulWidget {
  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen>
    with AutomaticKeepAliveClientMixin<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    List<OrderModel> orderModelList =
        Provider.of<AppProvider>(context).orderModelList;
    super.build(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
        child: ListView(
          children: <Widget>[
            SizedBox(height: 10.0),
            Text(
              "Lista de Pedidos",
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w800,
              ),
            ),
            SizedBox(height: 10.0),

            ListView.builder(
              primary: false,
              shrinkWrap: true,
              itemCount: orderModelList == null ? 0 : orderModelList.length,
              itemBuilder: (BuildContext context, int index) {
//                Food food = Food.fromJson(foods[index]);
                OrderModel orderModel = orderModelList[index];
//                print(foods);
//                print(foods.length);
                return GridOrder(
                  orderModel: orderModel,
                );
              },
            ),
  
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
