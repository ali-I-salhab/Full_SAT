
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:osta/data/models/worker_model.dart';
import 'package:osta/data/repositories/workers_repository.dart';
import 'package:osta/logic/workers_cubits/all_workers_cubit/all_workers_state.dart';

class AllWorkersCubit extends Cubit<AllWorkersState> {
  AllWorkersCubit() : super(AllWorkersInitial());

  WorkerRepo workerRepo = WorkerRepo();

  // MARK: - Variables.
  int page = 1;
  List<WorkerModel> workers = [];

  // MARK: - Load With Pagination Method.
  // Future<void> getWorkers() async {
    // MARK: - Variables.
  //   final currentState = state;
  //   bool isRefresh = false;
  //   var oldWorkers = <WorkerModel>[];
  //   // MARK: - States.
  //   if (state is GetAllWorkersLoadingState) return;
  //   if (currentState is GetAllWorkersSuccessState) {
  //     oldWorkers = currentState.allWorkers;
  //   } else if (currentState is GetAllWorkersLoadingState) {
  //     oldWorkers = currentState.oldWorkers;
  //     isRefresh = currentState.isRefresh;
  //   }
  //   emit(GetAllWorkersLoadingState(oldWorkers: oldWorkers, isRefresh: page == 1 ? false : isRefresh));
  //   await workerRepo.getAllWorkers(page).then((value) async{
  //     value.fold((l) {
  //       print(l.errorMessage);
  //       emit(GetAllWorkersErrorState(errorMsg: l.errorMessage ?? ''));
  //     },
  //             (r) {
  //               page++;
  //               workers.addAll(r);
  //               emit(GetAllWorkersSuccessState(allWorkers: workers,));
  //         } );
  //   });
  // }


//
//   int currentPage = 1 ;
//   bool isFetching = false;
//
//   Future<void> getAllWorkers() async{
//
//     // if(state is GetAllWorkersLoadingState) return ;
//     // final currentState = state;
//     // var oldWorkers = <WorkerModel>[];
// // if(currentState is GetAllWorkersSuccessState){
// //   oldWorkers = currentState.allWorkers;
// // }
// // emit(GetAllWorkersLoadingState(oldWorkers: oldWorkers,isFirstFetch: currentPage ==1));
//     emit(GetAllWorkersLoadingState());
//     await workerRepo.getAllWorkers(currentPage).then((value) async{
//       value.fold((l) {
//         print(l.errorMessage);
//         emit(GetAllWorkersErrorState(errorMsg: l.errorMessage ?? ''));
//       },
//               (r) {
//         // final workers = (state as GetAllWorkersLoadingState).oldWorkers;
//         // workers.addAll(r);
//             emit(GetAllWorkersSuccessState(allWorkers: r));
//             currentPage ++;
//           } );
//     });
//   }

  int currentPage = 1;

  Future<void> getAllWorkers({int pageNum = 1}) async {
    if(pageNum == 1){
      emit(GetAllWorkersFirstLoadState());
      workers.clear();
      await workerRepo.getAllWorkers(pageNum).then((value) async {
        value.fold((l) {
          print(l.errorMessage);
          emit(GetAllWorkersFirstErrorState(errorMsg: l.errorMessage ?? ''));
        },
                (r) {
          // pageNum ++;
          workers = r;
              emit(GetAllWorkersFirstSuccessState(workers: r));
            });
      });
    }
    else{
      emit(GetAllWorkersLoadingState());
      await workerRepo.getAllWorkers(pageNum).then((value) async {
        value.fold((l) {
          print(l.errorMessage);
          emit(GetAllWorkersErrorState(errorMsg: l.errorMessage ?? ''));
        },
                (r) {
           workers.addAll(r);
           print(workers.length);
              emit(GetAllWorkersSuccessState(
                  allWorkers: workers,existingWorkers: []));
            });
      });
    }

  }

  // Future<void> getAllWorkers({int currentPage = 1}) async {
  //   emit(GetAllWorkersLoadingState());
  //   if(currentPage == 1) workers.clear();
  //
  //   await workerRepo.getAllWorkers(currentPage).then((value) {
  //     return value.fold((l) {
  //       print(l.errorMessage);
  //             emit(GetAllWorkersErrorState(errorMsg: l.errorMessage ?? ''));
  //           },
  //                   (r) {
  //                     currentPage++;
  //                     workers.addAll(r);
  //                     emit(GetAllWorkersSuccessState(allWorkers: workers,));
  //               } );
  //   });
  //
  //   }


}