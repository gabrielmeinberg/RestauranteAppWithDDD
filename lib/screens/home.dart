import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app_with_ddd/application_layer/use_case/product_use_case.dart';
import 'package:restaurant_app_with_ddd/providers/app_provider.dart';
//import 'package:restaurant_app_with_ddd/screens/dishes.dart';
import 'package:restaurant_app_with_ddd/widgets/grid_product.dart';
//import 'package:restaurant_app_with_ddd/widgets/home_category.dart';
//import 'package:restaurant_app_with_ddd/widgets/slider_item.dart';
//import 'package:restaurant_app_with_ddd/util/foods.dart';
//import 'package:restaurant_app_with_ddd/util/categories.dart';
//import 'package:carousel_slider/carousel_slider.dart';
import 'package:restaurant_app_with_ddd/domain_layer/models/product_model.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with AutomaticKeepAliveClientMixin<Home> {
  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }

    return result;
  }

  //int _current = 0;
  
  @override
  Widget build(BuildContext context) {
    super.build(context);
    List<ProductModel> foods = Provider.of<AppProvider>(context).foods;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
        child: ListView(
          children: <Widget>[
            /*
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Destaques",
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                
                FlatButton(
                  child: Text(
                    "View More",
                    style: TextStyle(
//                      fontSize: 22,
//                      fontWeight: FontWeight.w800,
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                  onPressed: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context){
                          return DishesScreen();
                        },
                      ),
                    );
                  },
                ),
                
              ],
            ),

            SizedBox(height: 10.0),

            //Slider Here

            CarouselSlider(
              height: MediaQuery.of(context).size.height/2.4,
              items: map<Widget>(
                foods,
                    (index, i){
                      Map food = foods[index];
                  return SliderItem(
                    img: food['img'],
                    isFav: false,
                    name: food['name'],
                    rating: 5.0,
                    raters: 23,
                  );
                },
              ).toList(),
              autoPlay: true,
//                enlargeCenterPage: true,
              viewportFraction: 1.0,
//              aspectRatio: 2.0,
              onPageChanged: (index) {
                setState(() {
                  _current = index;
                });
              },
            ),
            
            SizedBox(height: 20.0),

            Text(
              "Food Categories",
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w800,
              ),
            ),
            SizedBox(height: 10.0),

            Container(
              height: 65.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: categories == null?0:categories.length,
                itemBuilder: (BuildContext context, int index) {
                  Map cat = categories[index];
                  return HomeCategory(
                    icon: cat['icon'],
                    title: cat['name'],
                    items: cat['items'].toString(),
                    isHome: true,
                  );
                },
              ),
            ),

            SizedBox(height: 20.0),
            */

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Pratos",
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                /*
                FlatButton(
                  child: Text(
                    "View More",
                    style: TextStyle(
//                      fontSize: 22,
//                      fontWeight: FontWeight.w800,
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                  onPressed: (){},
                ),
                */
              ],
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
              itemCount: foods == null ? 0 : foods.length,
              itemBuilder: (BuildContext context, int index) {
                ProductModel food = Provider.of<AppProvider>(context).foods[index];
                return GridProduct(
                  img: "assets/food1.jpeg",
                  isFav: false,
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
