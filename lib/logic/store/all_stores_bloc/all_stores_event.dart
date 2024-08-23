
import 'package:equatable/equatable.dart';

abstract class AllStoresEvent extends Equatable{
  const AllStoresEvent();
  @override
// TODO: implement props
  List<Object?> get props => [];
}
class GetStoresEvent extends AllStoresEvent{
  final int? firstPage;
  // final String? selectedCat;
  const GetStoresEvent({this.firstPage});
}
class GetStoresByCatEvent extends AllStoresEvent{
  final String? selectedCat;
  final int? firstPage;
  const GetStoresByCatEvent({this.selectedCat,this.firstPage});
}
