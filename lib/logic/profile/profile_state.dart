import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:osta/core/utils/enums.dart';
import 'package:osta/data/models/user_model.dart';

// class ProfileState extends Equatable {
//   const ProfileState({
//     this.userInfo,
//     this.getUserInfoState = RequestState.loading,
//     this.getUserInfoMessage = '',
//     this.editUserInfoState = RequestState.loading,
//     this.editUserInfoMessage = '',
//     this.changUserImageState = RequestState.loading,
//     this.changeUserImageMessage = '',
//     this.deleteUserImageState = RequestState.loading,
//     this.deleteUserImageMessage = '',
//   });
//
//   final UserModel? userInfo;
//   final RequestState getUserInfoState;
//   final String getUserInfoMessage;
//   final RequestState editUserInfoState;
//   final String editUserInfoMessage;
//   final RequestState changUserImageState;
//   final String changeUserImageMessage;
//   final RequestState deleteUserImageState;
//   final String deleteUserImageMessage;
//
//   ProfileState copyWith({
//     UserModel? userInfo,
//     RequestState? getUserInfoState,
//     String? getUserInfoMessage,
//     RequestState? editUserInfoState,
//     String? editUserInfoMessage,
//     RequestState? changeUserImageState,
//     String? changeUserImageMessage,
//     RequestState? deleteUserImageState,
//     String? deleteUserImageMessage,
//   }) {
//     return ProfileState(
//         userInfo: userInfo ?? this.userInfo,
//         getUserInfoState: getUserInfoState ?? this.getUserInfoState,
//         getUserInfoMessage: getUserInfoMessage ?? this.getUserInfoMessage,
//         editUserInfoState: editUserInfoState ?? this.editUserInfoState,
//         editUserInfoMessage: editUserInfoMessage ?? this.editUserInfoMessage,
//         changUserImageState: changUserImageState ?? this.changUserImageState,
//         changeUserImageMessage: changeUserImageMessage ?? this.changeUserImageMessage,
//         deleteUserImageState: deleteUserImageState ?? this.deleteUserImageState,
//         deleteUserImageMessage:
//             deleteUserImageMessage ?? this.deleteUserImageMessage);
//   }
//
//   @override
//   List<Object?> get props => [
//         userInfo,
//         getUserInfoState,
//         getUserInfoMessage,
//         editUserInfoState,
//         editUserInfoMessage,
//         changUserImageState,
//         changeUserImageMessage,
//         changUserImageState,
//         changeUserImageMessage,
//         deleteUserImageState,
//         deleteUserImageMessage
//       ];
// }

abstract class ProfileState{
  const ProfileState();
}
class InitProfileState extends ProfileState{}

class PickImageFromGallery extends ProfileState{}

class GetUserInfoLoadingState extends ProfileState{}
class GetUserInfoSuccessState extends ProfileState {
  final UserModel user;
  const GetUserInfoSuccessState({required this.user});
}
class GetUserInfoErrorState extends ProfileState {
  final String errorMsg;
  const GetUserInfoErrorState({required this.errorMsg});
}

class EditUserInfoLoadingState extends ProfileState{}
class EditUserInfoSuccessState extends ProfileState {
  final UserModel user;
  const EditUserInfoSuccessState({required this.user});
}
class EditUserInfoErrorState extends ProfileState {
  final String errorMsg;
  const EditUserInfoErrorState({required this.errorMsg});
}

class ChangeProfileImageLoadingState extends ProfileState{}
class ChangeProfileImageSuccessState extends ProfileState {
  final UserModel user;
  const ChangeProfileImageSuccessState({required this.user});
}
class ChangeProfileImageErrorState extends ProfileState {
  final String errorMsg;
  const ChangeProfileImageErrorState({required this.errorMsg});
}

class DeleteProfileImageLoadingState extends ProfileState{}
class DeleteProfileImageSuccessState extends ProfileState {
  final UserModel user;
  const DeleteProfileImageSuccessState({required this.user});
}
class DeleteProfileImageErrorState extends ProfileState {
  final String errorMsg;
  const DeleteProfileImageErrorState({required this.errorMsg});
}