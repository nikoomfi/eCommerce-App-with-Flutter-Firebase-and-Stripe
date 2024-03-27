import 'package:flutter/material.dart';
import '../../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/';
  static Route route() {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName), builder: (_) => HomeScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: 'Zero To Unicorn'),
      bottomNavigationBar: custom_navigatorbar(),
    );
  }
}
