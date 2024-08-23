
import 'package:equatable/equatable.dart';
import 'package:osta/data/models/worker_model.dart';

// abstract class AllWorkersState {}
//
// class AllWorkersInitial extends AllWorkersState {}



enum WorkerStatus{loading, success, error}

class AllWorkersState extends Equatable{

  final WorkerStatus status;
  final List<WorkerModel> workers;
  final bool hasReachedMax;
  final String errorMessage;

  const AllWorkersState({
    this.status = WorkerStatus.loading,
    this.hasReachedMax = false,
    this.workers=const [],
    this.errorMessage=''
  });
  AllWorkersState copyWith({
    WorkerStatus? status,
    List<WorkerModel>? workers,
    bool? hasReachedMax,
    String? errorMessage,
  }){
    return AllWorkersState(
      status: status ?? this.status,
      workers: workers ?? this.workers,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [status,workers,hasReachedMax,errorMessage];
}

// final class AllWorkersState extends Equatable {
//   const AllWorkersState({
//     this.status = RequestStatus.initial,
//     this.workers = const <WorkerModel>[],
//     this.hasReachedMax = false,
//   });
//
//   final RequestStatus status;
//   final List<WorkerModel> workers;
//   final bool hasReachedMax;
//
//   AllWorkersState copyWith({
//     RequestStatus? status,
//     List<WorkerModel>? workers,
//     bool? hasReachedMax,
//   }) {
//     return AllWorkersState(
//       status: status ?? this.status,
//       workers: workers ?? this.workers,
//       hasReachedMax: hasReachedMax ?? this.hasReachedMax,
//     );
//   }
//
//   @override
//   String toString() {
//     return '''AllWorkersState { status: $status, hasReachedMax: $hasReachedMax, workers: ${workers.length} }''';
//   }
//
//   @override
//   List<Object> get props => [status, workers, hasReachedMax];
// }