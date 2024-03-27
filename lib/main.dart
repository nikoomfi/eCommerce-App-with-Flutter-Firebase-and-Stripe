import 'package:ecommerce_app/config/app_router.dart';
import 'package:flutter/material.dart';
import 'config/theme.dart';
import 'screens/screens.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Zero To Unicorn',
      theme: theme(),
      onGenerateRoute: AppRouter.onGenerateRoute,
      initialRoute: HomeScreen.routeName,
    );
  }
}


