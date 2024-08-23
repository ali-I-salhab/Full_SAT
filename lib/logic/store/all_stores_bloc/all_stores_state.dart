

import 'package:equatable/equatable.dart';
import 'package:osta/data/models/store_model.dart';
import 'package:osta/data/models/worker_model.dart';

// abstract class AllWorkersState {}
//
// class AllWorkersInitial extends AllWorkersState {}



enum StoreStatus{loading, success, error}

class AllStoresState extends Equatable{

  final StoreStatus status;
  final List<StoreModel> stores;
  final bool hasReachedMax;
  final String errorMessage;

  const AllStoresState({
    this.status = StoreStatus.loading,
    this.hasReachedMax = false,
    this.stores=const [],
    this.errorMessage=''
  });
  AllStoresState copyWith({
    StoreStatus? status,
    List<StoreModel>? stores,
    bool? hasReachedMax,
    String? errorMessage,
  }){
    return AllStoresState(
      status: status ?? this.status,
      stores: stores ?? this.stores,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [status,stores,hasReachedMax,errorMessage];
}