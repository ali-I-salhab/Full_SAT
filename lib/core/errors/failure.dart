// abstract class Failure {
//   final String? errorMessage;
//
//   const Failure({this.errorMessage});
// }
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String? errorMessage;

  const Failure({this.errorMessage});

  @override
  List<Object> get props => [];
}