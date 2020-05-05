import 'package:flutter/material.dart';
import 'package:restaurant_app_with_ddd/widgets/grid_product.dart';
import 'package:restaurant_app_with_ddd/domain_layer/models/product_model.dart';
import 'package:restaurant_app_with_ddd/application_layer/use_case/product_use_case.dart';

class FavoriteScreen extends StatefulWidget {
  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> with AutomaticKeepAliveClientMixin<FavoriteScreen>{

   List<ProductModel> foods;

  Future<void> update() async {
    Iterable<List<ProductModel>> products =
        await Future.wait([ProductUserCase().getAllProducts()]);
    setState(() {
      foods = products.first;
    });
  }

  @override
  void initState() {
    super.initState();
    update();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(10.0,0,10.0,0),
        child: ListView(
          children: <Widget>[
            SizedBox(height: 10.0),
            Text(
              "My Favorite Items",
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w800,
              ),
            ),
            SizedBox(height: 10.0),

            GridView.builder(
              shrinkWrap: true,
              primary: false,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: MediaQuery.of(context).size.width /
                    (MediaQuery.of(context).size.height / 1.25),
              ),
              itemCount: foods == null ? 0 :foods.length,
              itemBuilder: (BuildContext context, int index) {
//                Food food = Food.fromJson(foods[index]);
                ProductModel food = foods[index];
//                print(foods);
//                print(foods.length);
                return GridProduct(
                  img: "assets/food1.jpeg",
                  isFav: true,
                  product: food,
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
