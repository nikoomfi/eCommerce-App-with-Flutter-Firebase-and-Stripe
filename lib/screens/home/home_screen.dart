import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../models/category.dart';
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
      appBar: CustomAppbar(title: 'MJ Shopping'),
      bottomNavigationBar: custom_navigatorbar(),
      body: ListView(
        children: [
          Container(
            child: CarouselSlider(
              options: CarouselOptions(
                aspectRatio: 1.5,
                viewportFraction: 0.9,
                enlargeCenterPage: true,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
                enableInfiniteScroll: false,
              ),
              items: Category.catagories
                  .map((Category) => HeroCarouselCard(category: Category))
                  .toList(),
            ),
          ),
          SectionTitle(title: 'Recommended'), 
          ProductCarousel(products: Product.products.where((product) => product.isRecommended).toList(),),
          SectionTitle(title: 'Most Popular'), 
          ProductCarousel(products: Product.products.where((product) => product.isPopular).toList(),),
        ],
      ),
    );
  }
}