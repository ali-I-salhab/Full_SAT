
import 'package:file_picker/file_picker.dart';
import 'package:osta/data/models/category_model.dart';
import 'package:osta/data/models/field_info.dart';
import 'package:osta/data/models/order_models/invoice_model.dart';
import 'package:osta/data/models/order_models/order_details.dart';

abstract class MainState {
  const MainState();
}

class MainInitial extends MainState {}

class GetCategoriesLoadingState extends MainState {}
class GetCategoriesSuccessState extends MainState {
  final ServiceCategory categories;
  const GetCategoriesSuccessState({required this.categories});
}
class GetCategoriesErrorState extends MainState {
  final String errorMsg;
  const GetCategoriesErrorState({required this.errorMsg});
}

class GetScreenFormLoadingState extends MainState {}
class GetScreenFormSuccessState extends MainState {
  final ServiceFields serviceFields;
  const GetScreenFormSuccessState({required this.serviceFields});
}
class GetScreenFormErrorState extends MainState {
  final String errorMsg;
  const GetScreenFormErrorState({required this.errorMsg});
}
class SendDataLoadingState extends MainState {}
class SendDataSuccessState extends MainState {
final InvoiceModel invoice;
SendDataSuccessState({required this.invoice});
}
class SendDataErrorState extends MainState {
  final String errorMsg;
  const SendDataErrorState({required this.errorMsg});
}


class CreateClientOrderLoadingState extends MainState {}
class CreateClientOrderSuccessState extends MainState {
final OrderDetails orderDetails;
CreateClientOrderSuccessState({required this.orderDetails});
}
class CreateClientOrderErrorState extends MainState {
  final String errorMsg;
  const CreateClientOrderErrorState({required this.errorMsg});
}

class RemovePickedFile extends MainState{}

class AddPickedFile extends MainState{
  final List<PlatformFile> pickedFiles;
  AddPickedFile({required this.pickedFiles});
}