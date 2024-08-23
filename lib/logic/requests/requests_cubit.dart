import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:osta/data/models/order_models/order_details.dart';
import 'package:osta/data/repositories/order/all_orders_repository.dart';

part 'requests_state.dart';

class RequestsCubit extends Cubit<RequestsState> {
  RequestsCubit() : super(RequestsInitial()){
    getAllOrders();
  }

  AllOrdersRepository allOrdersRepository =AllOrdersRepository();

  Future<void> getAllOrders() async{

    emit(GetAllOrdersLoadingState());
    await allOrdersRepository.getAllOrders().then((value) async{
      value.fold((l) {
        print(l.errorMessage);
        emit(GetAllOrdersErrorState(errorMsg: l.errorMessage ?? ''));
      },
              (r) {
            emit(GetAllOrdersSuccessState(allOrders: r));
          } );
    });
  }


}
