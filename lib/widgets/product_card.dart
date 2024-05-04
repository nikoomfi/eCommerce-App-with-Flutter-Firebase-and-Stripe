import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/cart/cart_bloc.dart';
import '../models/category.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final double widthFactor;
  final double leftposition;
  final bool isWishlist;

  const ProductCard({
    Key? key,
    required this.product,
    this.widthFactor = 2.6,
    this.leftposition = 5,
    this.isWishlist = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double widthValue = MediaQuery.of(context).size.width / widthFactor;
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/product', arguments: product);
      },
      child: Stack(
        children: [
          Container(
            width: widthValue,
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 5,
            left: leftposition,
            child: Container(
              width: widthValue - leftposition,
              height: 60,
              decoration:
                  BoxDecoration(color: Colors.pink[300]!.withAlpha(150)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.name,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(color: Colors.white),
                        ),
                        Text(
                          '£${product.price}',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                    BlocBuilder<CartBloc, CartState>(builder: (context, state) {
                      if (state is CartLoading) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (state is CartLoaded) {
                        return Expanded(
                          child: IconButton(
                            onPressed: () {
                              context
                                  .read<CartBloc>()
                                  .add(CartProductAdded(product));
                            },
                            icon: Icon(
                              Icons.add_circle,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        );
                      } else {
                        return Text('Something went Wrong!');
                      }
                    }),
                    isWishlist
                        ? Expanded(
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.delete,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          )
                        : SizedBox(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
