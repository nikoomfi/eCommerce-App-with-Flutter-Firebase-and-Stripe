import 'package:ecommerce_app/blocs/cart/cart_bloc.dart';
import 'package:ecommerce_app/blocs/wishlist/wishlist_bloc.dart';
import 'package:ecommerce_app/models/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class custom_navigatorbar extends StatelessWidget {
  final String screen;
  final Product? product;
  const custom_navigatorbar({
    Key? key, required this.screen, this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.pink[300],
      child: Container(
        height: 20,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: 
             _selectNavigatorbar(context, screen) ?? _buildNavigatorbar(context),
           ),
      ),
    );
  }

  List<Widget>? _selectNavigatorbar(context, screen) {
    switch (screen) {
      case '/':
        return _buildNavigatorbar(context);
      case 'catalog':
        return _buildNavigatorbar(context);
      case 'wishlist':
        return _buildNavigatorbar(context);
      case 'product':
        return _buildAddToCartNavigatorbar(context, product);
      case 'cart':
        return _buildGoToCheckoutNavigatorbar(context);
      case 'checkout':
        return _buildOrderNowNavigatorbar(context);
      default:
        return _buildNavigatorbar(context);
    }
  }

  List<Widget> _buildNavigatorbar(context) {
    return [
      IconButton(
        onPressed: () {
          Navigator.pushNamed(context, '/');
        },
        icon: Icon(
          Icons.home,
          color: Colors.white,
        ),
      ),
      IconButton(
        onPressed: () {
          Navigator.pushNamed(context, '/cart');
        },
        icon: Icon(
          Icons.shopping_cart,
          color: Colors.white,
        ),
      ),
      IconButton(
        onPressed: () {
          Navigator.pushNamed(context, '/user');
        },
        icon: Icon(
          Icons.person,
          color: Colors.white,
        ),
      ),
    ];
  }

  List<Widget> _buildAddToCartNavigatorbar(context, product) {
    return [
      IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.share,
          color: Colors.white,
        ),
      ),
      BlocBuilder<WishlistBloc, WishlistState>(
        builder: (context, state) {
          if (state is Wishlistloading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is Wishlistloaded) {
            return IconButton(
              onPressed: () {
                final snackBar = SnackBar(
                  content: Text('Added to your Wishlist!'),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                context.read<WishlistBloc>().add(AddWishlistProduct(product));
              },
              icon: Icon(Icons.favorite, color: Colors.white),
            );
          }
          return Text('Something went wrong!');
        },
      ),
      BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is CartLoaded) {
            return ElevatedButton(
              onPressed: () {
                context.read<CartBloc>().add(CartProductAdded(product));
                Navigator.pushNamed(context, '/cart');
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                shape: RoundedRectangleBorder(),
              ),
              child: Text(
                'Add to Cart',
                style: Theme.of(context).textTheme.headline3,
              ),
            );
          }
          return Text('Something went wrong!');
        },
      ),
    ];
  }

  List<Widget> _buildGoToCheckoutNavigatorbar(context) {
    return [
      ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, '/checkout');
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          shape: RoundedRectangleBorder(),
        ),
        child: Text(
          'Go To Checkout',
          style: Theme.of(context).textTheme.headline3,
        ),
      ),
    ];
  }

  List<Widget> _buildOrderNowNavigatorbar(context) {
    return [
      ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          shape: RoundedRectangleBorder(),
        ),
        child: Text(
          'Order Now',
          style: Theme.of(context).textTheme.headline3,
        ),
      ),
    ];
  }
}
