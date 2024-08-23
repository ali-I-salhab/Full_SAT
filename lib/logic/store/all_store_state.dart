
import 'package:osta/data/models/store_model.dart';

abstract class AllStoreState {}

class AllStoreInitial extends AllStoreState {}

class GetAllStoresLoadingState extends AllStoreState{
  final List<StoreModel> oldStoress;
  final bool isFirstFetch;
  GetAllStoresLoadingState({
    required this.oldStoress,
    this.isFirstFetch = false
  });
}
class GetAllStoresSuccessState extends AllStoreState{
  final List<StoreModel> allStores;
  GetAllStoresSuccessState({required this.allStores});
}
class GetAllStoresErrorState extends AllStoreState{
  final String errorMsg;
  GetAllStoresErrorState({required this.errorMsg});
}