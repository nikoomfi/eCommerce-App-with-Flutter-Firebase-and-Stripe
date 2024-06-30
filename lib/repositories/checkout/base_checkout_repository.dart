import '../../models/category.dart';

abstract class BaseCheckoutRepository {
  Future<void> addCheckout(Checkout checkout);
}
