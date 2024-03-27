import 'package:flutter/material.dart';
import '../screens/screens.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    print('This is Route: ${settings.name}');

    switch (settings.name) {
      case '/':
        return HomeScreen.route();
      case HomeScreen.routeName:
        return HomeScreen.route();
      case CartScreen.routeName:
        return CartScreen.route();
      case CatalogScreen.routeName:
        return CatalogScreen.route();
      case ProductScreen.routeName:
        return ProductScreen.route();
      case WishlistScreen.routeName:
        return WishlistScreen.route();

      default:
        return errorRoute();
    }
  }

  static Route errorRoute() {
    return MaterialPageRoute(
        settings: RouteSettings(name: '/error'),
        builder: (_) => Scaffold(
              appBar: AppBar(title: Text('Error')),
            ));
  }
}
