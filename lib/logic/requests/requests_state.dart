part of 'requests_cubit.dart';

@immutable
abstract class RequestsState {
  const RequestsState();
}

class RequestsInitial extends RequestsState {}

class GetAllOrdersLoadingState extends RequestsState {}
class GetAllOrdersSuccessState extends RequestsState {
  final List<OrderDetails> allOrders;
  const GetAllOrdersSuccessState({required this.allOrders});
}
class GetAllOrdersErrorState extends RequestsState {
  final String errorMsg;
  const GetAllOrdersErrorState({required this.errorMsg});
}