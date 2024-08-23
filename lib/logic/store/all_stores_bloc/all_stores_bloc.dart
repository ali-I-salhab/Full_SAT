

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:osta/data/repositories/store/stores_repository.dart';
import 'package:osta/logic/store/all_stores_bloc/all_stores_event.dart';
import 'package:osta/logic/store/all_stores_bloc/all_stores_state.dart';

class AllStoresBloc extends Bloc<AllStoresEvent, AllStoresState> {
  AllStoresBloc() : super(AllStoresState()) {
    on<GetStoresEvent>(onGetAllStores, transformer: droppable());
    on<GetStoresByCatEvent>(onGetStoresByCat, transformer: droppable());
  }

  StoreRepo storeRepo = StoreRepo();
  int currentPage = 1;

  bool isFirstLoad = false;

  // Map<int,bool> selectedCat ={};

  Future<void> onGetAllStores(GetStoresEvent event,
      Emitter<AllStoresState> emit) async {
    print('triggred');
    if (state.hasReachedMax) return;
    if (event.firstPage == 1) {
      // if (state.status == StoreStatus.loading) {
      emit(state.copyWith(stores: List.of(state.stores)
        ..clear(),status: StoreStatus.loading,));
      // emit(state.copyWith(stores: List.of(state.stores)
      //   ..clear()));
      // if(currentPage == 1) emit(state.copyWith(workers: state.workers..clear(),status: WorkerStatus.loading,));
      currentPage =1 ;
    await storeRepo.getAllStores(pageNum: currentPage).then((value) =>
        value.fold((l) {
          isFirstLoad = false;
          emit(state.copyWith(
              status: StoreStatus.error,
              errorMessage: l.errorMessage ?? 'failed to fetch stores'));
        }, (r) {
          isFirstLoad = false;
          r.isEmpty
              ? emit(state.copyWith(
              hasReachedMax: true, status: StoreStatus.success))
              : emit(state.copyWith(
              status: StoreStatus.success,
              stores: r,
              hasReachedMax: false));
        }));
  } else {
      currentPage ++;
      await storeRepo.getAllStores(pageNum: currentPage).then((value) =>
          value.fold((l) {
            emit(state.copyWith(
                status: StoreStatus.error,
                errorMessage: l.errorMessage ?? 'failed to fetch stores'));
          }, (r) {
            r.isEmpty
                ? emit(state.copyWith(hasReachedMax: true))
                : emit(state.copyWith(
                status: StoreStatus.success,
                stores: List.of(state.stores)
                  ..addAll(r),
                hasReachedMax: false));
          }));

    }
    print(state.stores.length);
  }

  Future<void> onGetStoresByCat(GetStoresByCatEvent event,
      Emitter<AllStoresState> emit) async {
    if (state.hasReachedMax) return;
    if (event.firstPage == 1) {
    // if (state.status == StoreStatus.loading) {
      emit(state.copyWith(stores: List.of(state.stores)
        ..clear(),status: StoreStatus.loading,));
      int currentPage = 1;
      // if(currentPage == 1) emit(state.copyWith(workers: state.workers..clear(),status: WorkerStatus.loading,));
    await storeRepo.getAllStores(pageNum: currentPage,category: event.selectedCat).then((value) =>
        value.fold((l) {
          isFirstLoad = false;
          emit(state.copyWith(
              status: StoreStatus.error,
              errorMessage: l.errorMessage ?? 'failed to fetch stores'));
        }, (r) {
          isFirstLoad = false;
          r.isEmpty
              ? emit(state.copyWith(
              hasReachedMax: true, status: StoreStatus.success))
              : emit(state.copyWith(
              status: StoreStatus.success,
              stores: r,
              hasReachedMax: false));
        }));
  } else {
      currentPage ++;
        await storeRepo.getAllStores(pageNum: currentPage,category: event.selectedCat).then((value) =>
            value.fold((l) {
              emit(state.copyWith(
                  status: StoreStatus.error,
                  errorMessage: l.errorMessage ?? 'failed to fetch stores'));
            }, (r) {
              r.isEmpty
                  ? emit(state.copyWith(hasReachedMax: true))
                  : emit(state.copyWith(
                  status: StoreStatus.success,
                  stores: List.of(state.stores)
                    ..addAll(r),
                  hasReachedMax: false));
            }));
    }
    print(state.stores.length);
  }

  String? isCatSelected;

  void filterStore(String storeCat) {
    if (isCatSelected == null) {
      emit(state.copyWith(stores: state.stores));
    }

    else if (isCatSelected == storeCat) {
      emit(state.copyWith(
          stores: state.stores.where((element) => element.storeSpecialization ==
              storeCat).toList()));
    }
  }

  // Future<void> getAdsPosts({String? q}) async {
  //
  //
  //   try {
  //     Response res;
  //     if (postsSeed != null) {
  //       if (q == null || q.isEmpty) {
  //         res = await DioHelper.dio!
  //             .get('posts?page=$initaladPostPage&per_page=30');
  //       } else {
  //         res = await DioHelper.dio!
  //             .get('posts?page=$initaladPostPage&per_page=30&q=$q');
  //       }
  //     } else {
  //       if (q == null || q.isEmpty) {
  //         res = await DioHelper.dio!
  //             .get('posts?page=$initaladPostPage&per_page=30&seed=$postsSeed');
  //       } else {
  //         res = await DioHelper.dio!.get(
  //             'posts?page=$initaladPostPage&per_page=30&seed=$postsSeed&q=$q');
  //       }
  //     }
  //
  //     if (res.statusCode == 200) {
  //       if (initaladPostPage == 1 && (q == null || q.isNotEmpty)) {
  //         allPosts.clear();
  //       }
  //       postsSeed = res.data['seed'];
  //       if (res.data['data'].isEmpty && allPosts.isEmpty) {
  //         emit(AppCubitGotPostEmptyState(emptyList: "لايوجد اعلانات "));
  //       } else {
  //         for (var post in res.data['data']) {
  //           allPosts.add(AdPostModel.fromJson(post));
  //         }
  //
  //         emit(AppCubitGotPostHasBeenSuccessState(allPosts: allPosts));
  //       }
  //     } else {
  //       if (res.statusCode == 422) {
  //         emit(AppCubitGotPostHasBeenFailState(
  //             errorMessage: "لايجب ان يبدأ البحث بفراغ"));
  //       } else {
  //         emit(AppCubitGotPostHasBeenFailState(
  //             errorMessage: "خطأ في جلب البيانات"));
  //       }
  //     }
  //   } catch (e) {
  //     if (e == DioErrorType.connectionTimeout ||
  //         e == DioErrorType.receiveTimeout ||
  //         e == SocketException) {
  //       emit(NoInternetOrInetnetWeak());
  //       emit(AppCubitGotPostHasBeenFailState(errorMessage: "خطأ غير معروف "));
  //     } else {}
  //   }
  // }



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
}