import 'package:ecommerce_app/blocs/checkout/checkout_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../widgets/widgets.dart';

class CheckoutScreen extends StatelessWidget {
  static const String routeName = '/checkout';
  
  // Constructor for CheckoutScreen widget
  const CheckoutScreen({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const CheckoutScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckoutBloc, CheckoutState>(
      builder: (context, state) {
        return Scaffold(
          appBar: CustomAppbar(title: 'Check out'),
          bottomNavigationBar: custom_navigatorbar(
            screen: routeName,
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: state is CheckoutLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : state is CheckoutLoaded
                    ? _buildLoadedUI(context)
                    : Text('Something went wrong!'),
          ),
        );
      },
    );
  }

  Widget _buildLoadedUI(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Customer Information',
          style: Theme.of(context).textTheme.headline3,
        ),
        _buildTextFormField(
          (value) {
            context.read<CheckoutBloc>().add(UpdateCheckout(email: value));
          },
          context,
          'Email',
        ),
        _buildTextFormField(
          (value) {
            context.read<CheckoutBloc>().add(UpdateCheckout(fullName: value));
          },
          context,
          'Full Name',
        ),
        Text(
          'Delivery Information',
          style: Theme.of(context).textTheme.headline3,
        ),
        _buildTextFormField(
          (value) {
            context.read<CheckoutBloc>().add(UpdateCheckout(address: value));
          },
          context,
          'Address',
        ),
        _buildTextFormField(
          (value) {
            context.read<CheckoutBloc>().add(UpdateCheckout(country: value));
          },
          context,
          'Country',
        ),
        _buildTextFormField(
          (value) {
            context.read<CheckoutBloc>().add(UpdateCheckout(city: value));
          },
          context,
          'City',
        ),
        _buildTextFormField(
          (value) {
            context.read<CheckoutBloc>().add(UpdateCheckout(zipCode: value));
          },
          context,
          'Zip Code',
        ),
        Text(
          'Order Summary',
          style: Theme.of(context).textTheme.headline3,
        ),
        OrderSummary(),
      ],
    );
  }

  Padding _buildTextFormField(
    Function(String)? onChanged,
    BuildContext context,
    String labelText,
  ) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          SizedBox(
            width: 75,
            child: Text(
              labelText,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          Expanded(
            child: TextFormField(
              onChanged: onChanged,
              decoration: InputDecoration(
                isDense: true,
                contentPadding: const EdgeInsets.only(left: 10),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
