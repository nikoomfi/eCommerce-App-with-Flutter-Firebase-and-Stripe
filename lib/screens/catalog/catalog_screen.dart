import 'package:flutter/material.dart';
import '../../widgets/widgets.dart';

class CatalogScreen extends StatelessWidget {
  static const String routeName = '/catalog';
  static Route route() {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName), builder: (_) => CatalogScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: 'Catalog'),
      bottomNavigationBar: custom_navigatorbar(),
    );
  }
}
