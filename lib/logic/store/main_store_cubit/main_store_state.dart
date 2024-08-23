
import 'package:osta/data/models/store_product.dart';

abstract class MainStoreState {}

class MainStoreInitial extends MainStoreState {}

class AddedToCartState extends MainStoreState {
  final List<StoreProductModel> cartProducts;
  AddedToCartState({required this.cartProducts});
}
class RemovedFromCartState extends MainStoreState {}

class QuantityIncreaseState extends MainStoreState {}
class QuantityDecreaseState extends MainStoreState {}
