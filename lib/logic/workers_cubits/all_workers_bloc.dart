import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:osta/data/repositories/workers_repository.dart';
import 'package:osta/logic/workers_cubits/all_workers_state.dart';
import 'package:osta/logic/workers_cubits/all_workers_event.dart';

class AllWorkersBloc extends Bloc<AllWorkersEvent, AllWorkersState> {

  AllWorkersBloc() : super(AllWorkersState()) {
    on<GetWorkersEvent>(onGetAllWorkers,transformer: droppable());
  }

  WorkerRepo workerRepo = WorkerRepo();
  int currentPage = 1 ;
  bool isFirstLoad =false;

  Future<void> onGetAllWorkers(GetWorkersEvent event, Emitter<AllWorkersState> emit) async {
        if (state.hasReachedMax) return;
            if (event.firstPage == 1) {
              //           if (state.status == WorkerStatus.loading) {
              emit(state.copyWith(workers: List.of(state.workers)
                ..clear(),status: WorkerStatus.loading,));
              currentPage =1 ;
            // if(currentPage == 1) emit(state.copyWith(workers: state.workers..clear(),status: WorkerStatus.loading,));
            await workerRepo.getAllWorkers(currentPage).then((value) => value.fold((l){
              emit(state.copyWith(
                  status: WorkerStatus.error,
                  errorMessage: l.errorMessage ?? 'failed to fetch workers'));
            }, (r) {
              r.isEmpty
              ? emit(state.copyWith(hasReachedMax: true,status: WorkerStatus.success))
                  : emit(state.copyWith(
                  status: WorkerStatus.success,
                  workers: r,
                  hasReachedMax: false));
            }));
          } else {
            currentPage ++ ;
            await workerRepo.getAllWorkers(currentPage).then((value) => value.fold((l){
              emit(state.copyWith(
                  status: WorkerStatus.error,
                  errorMessage: l.errorMessage ?? 'failed to fetch workers'));
            }, (r) {

              r.isEmpty
                  ? emit(state.copyWith(hasReachedMax: true))
                  : emit(state.copyWith(
                  status: WorkerStatus.success,
                  workers: List.of(state.workers)..addAll(r),
                  hasReachedMax: false));
            }));
          }
          print(state.workers.length);
      }

  //
  //   if (state.hasReachedMax) return;
  //     if (state.status == RequestStatus.initial) {
  //       isFirstLoad = true;
  //       await workerRepo.getAllWorkers(currentPage).then((value) async{
  //         value.fold((l) {
  //           isFirstLoad = false;
  //           print(l.errorMessage);
  //           emit(state.copyWith(status: RequestStatus.failure));
  //         },
  //                 (r) {
  //                   isFirstLoad = false;
  //           // currentPage ++;
  //                   return emit(state.copyWith(
  //                     status: RequestStatus.success,
  //                     workers: r,
  //                     hasReachedMax: false,
  //                   ));
  //             } );
  //       });
  //
  //     }
  //     else{
  //   currentPage++ ;
  //   isFirstLoad = false;
  //   await workerRepo.getAllWorkers(currentPage).then((value) async{
  //     value.fold((l) {
  //       print(l.errorMessage);
  //       emit(state.copyWith(status: RequestStatus.failure));
  //     },
  //             (r) {
  //               emit(r.isEmpty
  //                   ? state.copyWith(hasReachedMax: true)
  //                   : state.copyWith(
  //                 status: RequestStatus.success,
  //                 workers: List.of(state.workers)..addAll(r),
  //                 hasReachedMax: false,
  //               ));
  //         } );
  //   });
  // }
  // }

}