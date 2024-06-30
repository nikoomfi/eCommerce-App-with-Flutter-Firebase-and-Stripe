import 'package:ecommerce_app/blocs/cart/cart_bloc.dart';
import 'package:ecommerce_app/blocs/category/category_bloc.dart';
import 'package:ecommerce_app/blocs/checkout/checkout_bloc.dart';
import 'package:ecommerce_app/blocs/product/product_bloc.dart';
import 'package:ecommerce_app/blocs/wishlist/wishlist_bloc.dart';
import 'package:ecommerce_app/config/app_router.dart';
import 'package:ecommerce_app/repositories/category/category_repository.dart';
import 'package:ecommerce_app/repositories/checkout/checkout_repository.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'config/theme.dart';
import 'repositories/product/product_repository.dart';
import 'screens/screens.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => WishlistBloc()
            ..add(
              StartWishlist(),
            ),
        ),
        BlocProvider(
          create: (_) => CartBloc()
            ..add(
              CartStarted(),
            ),
        ),
        BlocProvider(
          create: (_) => CategoryBloc(
            categoryRepository: CategoryRepository(),
          )..add(LoadCategories()),
        ),
        BlocProvider(
          create: (_) => ProductBloc(
            productRepository: ProductRepository(),
          )..add(LoadProducts()),
        ),
        BlocProvider(
          create: (context) => CheckoutBloc(
            cartBloc: context.read<CartBloc>(),
            checkoutRepository: CheckoutRepository(),
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MJ SHOPPING',
        theme: theme(),
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: SplashScreen.routeName,
      ),
    );
  }
}
