import 'package:ecommerce_app/blocs/wishlist/wishlist_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../widgets/widgets.dart';

class WishlistScreen extends StatelessWidget {
  static const String routeName = '/wishlist';
  static Route route() {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (_) => WishlistScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: 'WishList'),
      bottomNavigationBar: custom_navigatorbar(screen: routeName),
      body: BlocBuilder<WishlistBloc, WishlistState>(builder: (context, state) {
        if (state is Wishlistloading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
          if (state is Wishlistloaded){
            return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio: 2.1 ,
            ),
            itemCount: state.wishlist.products.length,
            itemBuilder: (BuildContext context, int index) {
              return Center(
                child: ProductCard(
                  product: state.wishlist.products[index],
                  widthFactor: 1.1,
                  leftposition: 180,
                  isWishlist: true,
                ),
              );
            },
          );
          }
        else {
          return Text('Something went wrong!');
        }
        }
      ),
    );
  }
}
