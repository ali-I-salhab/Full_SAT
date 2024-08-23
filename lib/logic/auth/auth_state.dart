
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../data/models/user_model.dart';

abstract class AuthState extends Equatable{
  const AuthState();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class AuthInitialState extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthenticatedState extends AuthState {
  final UserModel user;
  AuthenticatedState({required this.user});
}

class UnAuthenticatedState extends AuthState {}

class AuthErrorState extends AuthState {
  final String errorMsg ;
  const AuthErrorState({required this.errorMsg});
}
class AuthCodeSentState extends AuthState {}

class AuthCodeVerifiedState extends AuthState {}

class AuthNewUserSuccessState extends AuthState {}
class AuthSuccesstate extends AuthState {}

class CodeEnteredEmptyState extends AuthState {}
class CodeEnteredShortState extends AuthState {}
class CodeEnteredUnmatchState extends AuthState {}

class GetDeviceInfoLoadingState extends AuthState{}
class GetDeviceInfoSuccessState extends AuthState {
  final String deviceTok;
  const GetDeviceInfoSuccessState({required this.deviceTok});
}
class GetDeviceInfoErrorState extends AuthState {
  final String errorMsg;
  const GetDeviceInfoErrorState({required this.errorMsg});
}
//
// class GetUserInfoLoadingState extends AuthState{}
// class GetUserInfoSuccessState extends AuthState {
//   final UserModel user;
//   const GetUserInfoSuccessState({required this.user});
// }
// class GetUserInfoErrorState extends AuthState {
//   final String errorMsg;
//   const GetUserInfoErrorState({required this.errorMsg});
// }
//
// class EditUserInfoLoadingState extends AuthState{}
// class EditUserInfoSuccessState extends AuthState {
//   final UserModel user;
//   const EditUserInfoSuccessState({required this.user});
// }
// class EditUserInfoErrorState extends AuthState {
//   final String errorMsg;
//   const EditUserInfoErrorState({required this.errorMsg});
// }
//
// class ChangeProfileImageLoadingState extends AuthState{}
// class ChangeProfileImageSuccessState extends AuthState {
//   final UserModel user;
//   const ChangeProfileImageSuccessState({required this.user});
// }
// class ChangeProfileImageErrorState extends AuthState {
//   final String errorMsg;
//   const ChangeProfileImageErrorState({required this.errorMsg});
// }
//
// class DeleteProfileImageLoadingState extends AuthState{}
// class DeleteProfileImageSuccessState extends AuthState {
//   final UserModel user;
//   const DeleteProfileImageSuccessState({required this.user});
// }
// class DeleteProfileImageErrorState extends AuthState {
//   final String errorMsg;
//   const DeleteProfileImageErrorState({required this.errorMsg});
// }