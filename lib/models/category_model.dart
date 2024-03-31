import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String name;
  final String imageUrl;

  const Category({
    required this.name,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [name, imageUrl];

  static List<Category> catagories = [
    Category(
      name: 'Women',
      imageUrl:
          'https://images-eu.ssl-images-amazon.com/images/G/02/AMAZON-FASHION/2024/FASHION/FLIP/03_MARCH/L1W_DESK_4-BLOCK_04.jpg'),
    Category(
      name: 'Kids & Baby',
      imageUrl:
          'https://images-eu.ssl-images-amazon.com/images/G/02/AMAZON-FASHION/2023/FASHION/FLIP/STOREFRONT/05_MAY/KIDS/Storefront_Image_M_BB_Bab_375x488.jpg'),
    Category(
        name: 'Men',
        imageUrl:
          'https://images-eu.ssl-images-amazon.com/images/G/02/AMAZON-FASHION/2024/FASHION/FLIP/03_MARCH/L1M_DESK_4-BLOCK_03.jpg'
    ),
    Category(
        name: 'Luggage & Travel',
        imageUrl:
          'https://m.media-amazon.com/images/I/81wwYRDv4nL._AC_UL320_.jpg'
    ),
  ];
}
