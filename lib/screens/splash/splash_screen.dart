import 'dart:async';
import 'package:flutter/material.dart';
import '../../models/category.dart';
import '../../widgets/widgets.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = '/splash';
  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => SplashScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () => Navigator.pushNamed(context, '/'));
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image(
              image: AssetImage('assets/image/MJ Logo 1.png'),
              width: 125,
              height: 125,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text('MJ Shopping', style: Theme.of(context).textTheme.headline2!.copyWith(color: Colors.pink[300]),),
        ],
      ),
    );
  }
}
