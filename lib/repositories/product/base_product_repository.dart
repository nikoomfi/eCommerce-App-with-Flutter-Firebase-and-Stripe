import '../../models/category.dart';

abstract class BaseProductRepository {
  Stream<List<Product>> getAllProducts();
}
