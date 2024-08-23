
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:osta/data/models/store_model.dart';
import 'package:osta/data/models/worker_model.dart';
import 'package:osta/data/repositories/store/stores_repository.dart';
import 'package:osta/data/repositories/workers_repository.dart';
import 'package:osta/logic/store/all_store_state.dart';
import 'package:osta/logic/workers_cubits/all_workers_cubit/all_workers_state.dart';

class AllStoresCubit extends Cubit<AllStoreState> {
  AllStoresCubit() : super(AllStoreInitial());

  StoreRepo storeRepo = StoreRepo();

  int currentPage = 1 ;

  Future<void> getAllStores() async{

    if(state is GetAllWorkersLoadingState) return ;
    final currentState = state;
    var oldStores = <StoreModel>[];
    if(currentState is GetAllStoresSuccessState){
      oldStores = currentState.allStores;
    }
    emit(GetAllStoresLoadingState(oldStoress: oldStores,isFirstFetch: currentPage ==1));
    // emit(GetAllWorkersLoadingState());
    await storeRepo.getAllStores( pageNum: currentPage).then((value) async{
      value.fold((l) {
        print(l.errorMessage);
        emit(GetAllStoresErrorState(errorMsg: l.errorMessage ?? ''));
      },
              (r) {
            currentPage ++;
            final stores = (state as GetAllStoresLoadingState).oldStoress;
            stores.addAll(r);
            emit(GetAllStoresSuccessState(allStores: stores));
          } );
    });
  }

}
