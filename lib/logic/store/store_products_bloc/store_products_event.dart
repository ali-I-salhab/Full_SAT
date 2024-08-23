
import 'package:equatable/equatable.dart';

abstract class StoreProductsEvent extends Equatable{
  @override
// TODO: implement props
  List<Object?> get props => [];
}
class GetStoreProductsEvent extends StoreProductsEvent{
  final int storeId;
  final int? firstPage;
  GetStoreProductsEvent({required this.storeId,this.firstPage});
}
