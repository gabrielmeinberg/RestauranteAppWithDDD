import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:restaurant_app_with_ddd/application_layer/use_case/cart_use_case.dart';
import 'package:restaurant_app_with_ddd/application_layer/use_case/product_use_case.dart';
import 'package:restaurant_app_with_ddd/domain_layer/models/cart_model.dart';
import 'package:restaurant_app_with_ddd/domain_layer/models/product_model.dart';
import 'package:restaurant_app_with_ddd/util/const.dart';
import 'package:restaurant_app_with_ddd/widgets/cart_item.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppProvider extends ChangeNotifier{
  AppProvider(){
    checkTheme();
    getFoods();
    getCart();
  }


  ThemeData theme = Constants.lightTheme;
  Key key = UniqueKey();
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  List<ProductModel> foods;
  CartModel cart;

  void setKey(value) {
    key = value;
    notifyListeners();
  }

  void setNavigatorKey(value) {
    navigatorKey = value;
    notifyListeners();
  }

  void setTheme(value, c) {
    theme = value;
    SharedPreferences.getInstance().then((prefs){
      prefs.setString("theme", c).then((val){
        SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
          statusBarColor: c == "dark" ? Constants.darkPrimary : Constants.lightPrimary,
          statusBarIconBrightness: c == "dark" ? Brightness.light:Brightness.dark,
        ));
      });
    });
    notifyListeners();
  }

  ThemeData getTheme(value) {
    return theme;
  }

  Future<ThemeData> checkTheme() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    ThemeData t;
    String r = prefs.getString("theme") == null ? "light" : prefs.getString(
        "theme");

    if(r == "light"){
      t = Constants.lightTheme;
      setTheme(Constants.lightTheme, "light");
    }else{
      t = Constants.darkTheme;
      setTheme(Constants.darkTheme, "dark");
    }

    return t;
  }

  void getFoods() async {
    Iterable<List<ProductModel>> products =
        await Future.wait([ProductUserCase().getAllProducts()]);

    foods = products.first;

    notifyListeners();
  }

  void getCart() async {
    Iterable<CartModel> cartReturn =
        await Future.wait([CartUserCase().getCart()]);
    cart = cartReturn.first;

    notifyListeners();
  }

  Future<void> addItemCart(ProductModel product, int quantity) async {
    await Future.wait([CartUserCase().addItemCart(product, quantity)]);
    getCart();

    notifyListeners();
  }

  Future<void> deleteItemCart(CartItemModel item) async {
    await Future.wait([CartUserCase().deleteItem(item)]);
    getCart();

    notifyListeners();
  }

  Future<void> makeOrder(CartModel cart) async {
    await Future.wait([CartUserCase().makeOrder(cart)]);
    getCart();
    notifyListeners();
  }
  
}