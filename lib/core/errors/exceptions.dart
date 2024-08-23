import 'package:equatable/equatable.dart';
import 'package:osta/core/errors/error_message_model.dart';

// class ServerException extends Equatable implements Exception {
//   final String? exception;
//
//   const ServerException({this.exception});
//
//   @override
//   List<Object?> get props => [exception];
// }
class ServerException implements Exception {
  final ErrorMessageModel errorMessageModel;

  const ServerException({
    required this.errorMessageModel,
  });
}
