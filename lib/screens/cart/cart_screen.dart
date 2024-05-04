import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/cart/cart_bloc.dart';
import '../../widgets/widgets.dart';

class CartScreen extends StatelessWidget {
  static const String routeName = '/cart';
  static Route route() {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName), builder: (_) => CartScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: 'Cart'),
      bottomNavigationBar: BottomAppBar(
        color: Colors.pink[300],
        child: Container(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.white),
                  onPressed: () {},
                  child: Text('GO TO CHECKOUT',
                      style: Theme.of(context)
                          .textTheme
                          .headline3!
                          .copyWith(color: Colors.pink[300])))
            ],
          ),
        ),
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is CartLoaded) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            state.cart.freeDeliveryString,
                            style: Theme.of(context).textTheme.headline5,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/');
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.pink[300],
                              shape: RoundedRectangleBorder(),
                              elevation: 0,
                            ),
                            child: Text(
                              'Add Items',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(
                                    color: Colors.white,
                                  ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 350,
                        child: ListView.builder(
                          itemCount: state.cart.products.length,
                          itemBuilder: (context, index) {
                            return CartProductCard(
                              product: state.cart.products[index],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Divider(
                        thickness: 2,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 10,
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'SubTotal',
                                  style: Theme.of(context).textTheme.headline5,
                                ),
                                Text(
                                  '\£${state.cart.subtotatalString}',
                                  style: Theme.of(context).textTheme.headline5,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Delivery Free',
                                  style: Theme.of(context).textTheme.headline5,
                                ),
                                Text(
                                  '\£${state.cart.deliveryFreeString}',
                                  style: Theme.of(context).textTheme.headline5,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Stack(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 30,
                            color: Colors.pink[300],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 30,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Total',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5!
                                      .copyWith(
                                        color: Colors.white,
                                      ),
                                ),
                                Text(
                                  '\£${state.cart.totalString}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5!
                                      .copyWith(
                                        color: Colors.white,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            );
          } else {
            return Text('Somthing went Wrong!');
          }
        },
      ),
    );
  }
}
