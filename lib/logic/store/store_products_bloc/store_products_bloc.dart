import 'dart:async';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:osta/data/repositories/store/stores_repository.dart';
import 'package:osta/logic/store/store_products_bloc/store_products_event.dart';
import 'package:osta/logic/store/store_products_bloc/store_products_state.dart';


class StoreProductsBloc extends Bloc<StoreProductsEvent, AllProductsState> {
  StoreProductsBloc() : super(AllProductsState()) {
    on<GetStoreProductsEvent>(onGetStoreProducts,transformer: droppable());

  }

  StoreRepo storeRepo = StoreRepo();
  int currentPage = 1 ;
  bool isFirstLoad =false;

  Future<void> onGetStoreProducts(GetStoreProductsEvent event, Emitter<AllProductsState> emit) async {
    if (state.hasReachedMax) return;
    if (event.firstPage == 1) {
      // if (state.status == ProductStatus.loading) {
      emit(state.copyWith(products: List.of(state.products)
        ..clear(),status: ProductStatus.loading,));
      isFirstLoad =true;
      emit(state.copyWith(products: List.of(state.products)..clear()));
      // if(currentPage == 1) emit(state.copyWith(workers: state.workers..clear(),status: WorkerStatus.loading,));
     currentPage = 1;
      await storeRepo.getAllStoreProducts(currentPage,event.storeId).then((value) => value.fold((l){
        isFirstLoad =false;
        emit(state.copyWith(
            status: ProductStatus.error,
            errorMessage: l.errorMessage ?? 'failed to fetch stores'));
      }, (r) {
        isFirstLoad =false;
        r.isEmpty
            ? emit(state.copyWith(hasReachedMax: true,status: ProductStatus.success))
            : emit(state.copyWith(
            status: ProductStatus.success,
            products: r,
            hasReachedMax: false));
      }));
    } else {
      currentPage ++ ;
      await storeRepo.getAllStoreProducts(currentPage,event.storeId).then((value) => value.fold((l){
        emit(state.copyWith(
            status: ProductStatus.error,
            errorMessage: l.errorMessage ?? 'failed to fetch stores'));
      }, (r) {

        r.isEmpty
            ? emit(state.copyWith(hasReachedMax: true))
            : emit(state.copyWith(
            status: ProductStatus.success,
            products: List.of(state.products)..addAll(r),
            hasReachedMax: false));
      }));
    }
    print(state.products.length);
  }

}







// void onChange(Change<BaseState> change) async {
//   final nextState = change.nextState;
//   if (nextState is BaseFailState) {
//     final error = nextState.error;
//     if (error is UnauthorizedError || error is ForbiddenError) {
//       await DIManager.sharedPrefs.clearExpiryTokenDate();
//       await DIManager.sharedPrefs.clearToken();
//       await DIManager.resetAllBlocs();
//       Future.delayed(const Duration(milliseconds: 300), () {
//         AppNavigator.currentContext.beamToNamed(LoginPage.routeName(''),stacked: false);
//       });
//     }
//   }
//   super.onChange(change);
// }

