
import 'package:equatable/equatable.dart';
import 'package:osta/data/models/worker_model.dart';

abstract class AllWorkersState extends Equatable{
  const AllWorkersState();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class AllWorkersInitial extends AllWorkersState {}

class GetAllWorkersFirstLoadState extends AllWorkersState{}
class GetAllWorkersFirstSuccessState extends AllWorkersState{
  final List<WorkerModel> workers;
  GetAllWorkersFirstSuccessState({required this.workers});

}
class GetAllWorkersFirstErrorState extends AllWorkersState{
  final String errorMsg;
  GetAllWorkersFirstErrorState({required this.errorMsg});
}

class GetAllWorkersLoadingState extends AllWorkersState{
  // final List<WorkerModel> oldWorkers;
  // final bool isRefresh;
  GetAllWorkersLoadingState(
    // { required this.oldWorkers,
    // this.isRefresh = false
// }
      );

}

class GetAllWorkersSuccessState extends AllWorkersState{
  final List<WorkerModel> allWorkers;
  final List<WorkerModel> existingWorkers;
  @override
  List<Object> get props => [allWorkers, existingWorkers];
  GetAllWorkersSuccessState({required this.allWorkers,required this.existingWorkers});
}


class GetAllWorkersErrorState extends AllWorkersState{
  final String errorMsg;
  GetAllWorkersErrorState({required this.errorMsg});
}
