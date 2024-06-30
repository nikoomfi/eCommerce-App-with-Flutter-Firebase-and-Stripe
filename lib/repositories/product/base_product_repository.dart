import '../../models/category.dart';

abstract class BaseCheckoutRepository {
  Stream<List<Product>> getAllProducts();
}
