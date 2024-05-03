import 'package:ecommerce_app/blocs/cart/Cart_bloc.dart';
import 'package:ecommerce_app/blocs/wishlist/wishlist_bloc.dart';
import 'package:ecommerce_app/config/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'config/theme.dart';
import 'screens/screens.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => WishlistBloc()..add(StartWishlist(),),),
        BlocProvider(create: (_) => CartBloc()..add(CartStarted(),),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MJ SHOPPING',
        theme: theme(),
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: HomeScreen.routeName,
      ),
    );
  }
}

