
import 'package:equatable/equatable.dart';

abstract class AllWorkersEvent extends Equatable{
@override
// TODO: implement props
List<Object?> get props => [];
}
class GetWorkersEvent extends AllWorkersEvent{
  final int? firstPage;
  GetWorkersEvent({this.firstPage});
}
