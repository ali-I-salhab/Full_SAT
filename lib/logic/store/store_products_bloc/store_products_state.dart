

import 'package:equatable/equatable.dart';
import 'package:osta/data/models/store_product.dart';

enum ProductStatus{loading, success, error}

class AllProductsState extends Equatable{

  final ProductStatus status;
  final List<StoreProductModel> products;
  final bool hasReachedMax;
  final String errorMessage;

  const AllProductsState({
    this.status = ProductStatus.loading,
    this.hasReachedMax = false,
    this.products=const [],
    this.errorMessage=''
  });
  AllProductsState copyWith({
    ProductStatus? status,
    List<StoreProductModel>? products,
    bool? hasReachedMax,
    String? errorMessage,
  }){
    return AllProductsState(
      status: status ?? this.status,
      products: products ?? this.products,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [status,products,hasReachedMax,errorMessage];
}