import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:osta/core/helpers/cache_helper.dart';
import 'package:osta/core/utils/enums.dart';
import 'package:osta/data/models/user_model.dart';
import 'package:osta/data/repositories/profile_repository.dart';
import 'package:osta/logic/profile/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(InitProfileState()){
    getSavedUserInfoInSP();
  }

  ProfileRepo profileRepo = ProfileRepo();

  static ProfileCubit get(BuildContext context) =>
      BlocProvider.of<ProfileCubit>(context);

  File? pickedImage;
  UserModel? user;

  Future<void> saveUserInfoInSP(UserModel? user) async {
    if (user != null) {
      await CacheHelper.saveData(
          key: 'userData', value: jsonEncode(user.toJson()));
      getSavedUserInfoInSP();
    } else {
      await CacheHelper.removeData(key: 'userData');
      getSavedUserInfoInSP();
    }
  }

  Future<UserModel?> getSavedUserInfoInSP() async {

    user = await CacheHelper.getStringData(key: 'userData') == null
        ? null
        : UserModel.fromJson(
            jsonDecode(CacheHelper.getStringData(key: 'userData')!));
  return user;
  }

  Future<void> getProfileImage() async {
    await ImagePicker().pickImage(source: ImageSource.gallery).then(
      (value) async {
        if (value != null) {
          pickedImage = File(value.path);
          print(pickedImage);
          // return pickedImage;
          // await changeProfileImage(image: pickedImage!);
          emit(PickImageFromGallery());
        }
      },
    );
    // });
  }

  Future<void> getUserInfo() async {
    emit(GetUserInfoLoadingState());
    await profileRepo.getUserInfo().then((value) async {
      value.fold((l) {
        print(l.errorMessage);
        emit(GetUserInfoErrorState(errorMsg: l.errorMessage.toString()));
        // emit(state.copyWith(
        //     getUserInfoState: RequestState.error,
        //     getUserInfoMessage: l.errorMessage,
        // ));
      }, (r) async {
        await saveUserInfoInSP(r);
        emit(GetUserInfoSuccessState(user: r));
        // emit(state.copyWith(
        //     userInfo: r,
        //     getUserInfoState: RequestState.loaded,
        //     ));
      });
    });
  }

  //
  Future<void> editAccount({
    String? name,
    String? email,
    String? deviceToken,
    String? addressId,
    String? addressDesc,
    List<String>? gps,
  }) async {
    emit(EditUserInfoLoadingState());
    await profileRepo
        .editAccountInfo(
            name: name,
            email: email,
            deviceToken: deviceToken,
            addressId: addressId,
            addressDesc: addressDesc,
            gps: gps)
        .then((value) async {
      value.fold((l) {
        print(l.errorMessage);
        emit(EditUserInfoErrorState(errorMsg: l.errorMessage ?? ''));

        // emit(
        //     state.copyWith(editUserInfoState: RequestState.error,
        //     editUserInfoMessage: l.errorMessage
        //     ));
      }, (r) async {
        await saveUserInfoInSP(r);
        emit(EditUserInfoSuccessState(user: r));
        // emit(state.copyWith(
        //     editUserInfoState: RequestState.loaded,
        //     userInfo: r,
        //     ));
      });
    });
  }

  Future<void> changeProfileImage({required File image}) async {
    emit(ChangeProfileImageLoadingState());
    print(image.path);
    await profileRepo.changeProfileImage(image: image).then((value) async {
      value.fold((l) {
        pickedImage = null;
        print(l.errorMessage);
        emit(ChangeProfileImageErrorState(errorMsg: l.errorMessage ?? ''));
        // emit(state.copyWith(
        //   changeUserImageState: RequestState.error,
        //   changeUserImageMessage: l.errorMessage,
        //     ));
      }, (r) async{
        pickedImage = null;
        await saveUserInfoInSP(r);
        emit(ChangeProfileImageSuccessState(user: r));
        // emit(state.copyWith(
        //     changeUserImageState: RequestState.loaded,
        //     userInfo: r,
        //     ));
      });
    });
  }

  Future<void> deleteProfileImage({required String phoneNumber}) async {
    emit(DeleteProfileImageLoadingState());
    await profileRepo
        .deleteProfileImage(phoneNumber: phoneNumber)
        .then((value) async {
      value.fold((l) {
        print(l.errorMessage);
        emit(DeleteProfileImageErrorState(errorMsg: l.errorMessage ?? ''));
        // emit(state.copyWith(
        //     deleteUserImageState: RequestState.error,
        //     deleteUserImageMessage: l.errorMessage,
        //     ));
      }, (r) async {
        pickedImage = null;
        await saveUserInfoInSP(r);

        emit(DeleteProfileImageSuccessState(user: r));
        // emit(state.copyWith(
        //     deleteUserImageState:RequestState.loaded,
        //   userInfo: r
        // ));
      });
    });
  }
}
