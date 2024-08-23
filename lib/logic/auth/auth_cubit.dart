
import 'dart:async';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:osta/core/helpers/cache_helper.dart';
import 'package:osta/data/api/dio_helper.dart';
import 'package:osta/logic/auth/auth_state.dart';

import '../../data/repositories/auth_repository.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitialState());

  static AuthCubit get(BuildContext context) => BlocProvider.of<AuthCubit>(context);

  AuthRepository authRepository = AuthRepository();

  TextEditingController phoneController = TextEditingController();

  TextEditingController verifyNum1 = TextEditingController();
  TextEditingController verifyNum2 = TextEditingController();
  TextEditingController verifyNum3 = TextEditingController();
  TextEditingController verifyNum4 = TextEditingController();
  TextEditingController verifyNum5 = TextEditingController();
  TextEditingController verifyNum6 = TextEditingController();

  String verificationCodeEntered = '';

  String? verificationID;

  void sendOTP(String phoneNumber) async {
    emit(AuthLoadingState());
    try {
      print(phoneNumber);
      await authRepository.sendOtp(
          phoneNumber: phoneNumber,
          phoneVerificationFailed: (FirebaseAuthException e) {
            print(e);
            emit(AuthErrorState(errorMsg: e.message.toString()));
          },
          phoneVerificationCompleted: (PhoneAuthCredential credential) {
          //   signInWithPhone(credential);
          //   emit(AuthenticatedState(user: user))
          },
          phoneCodeSent: (String verificationId, int? refreshToken) {
            // print(verificationId);
            verificationID = verificationId;
            emit(AuthCodeSentState());
          },
          autoRetrievalTimeout: (String verificationId) {
            verificationID = verificationId;
          });
    } catch (e) {
      emit(AuthErrorState(errorMsg: e.toString()));
    }
  }

  void verifyOTP(String otp) async {
  emit(AuthLoadingState());
  // await authRepository.verifyAndLogin(verificationID!,otp);
  PhoneAuthCredential credential = PhoneAuthProvider.credential(
  verificationId: verificationID!, smsCode: otp);
  await signInWithPhone(credential);
  }

  Future<void> signInWithPhone(AuthCredential credential) async {

    try{
      UserCredential userCredential = await authRepository.signInWithPhone(credential);
      // if (userCredential.user == null) return ;
      if(userCredential.user != null){
        // userCredential.additionalUserInfo?.isNewUser;
       await userCredential.user!.getIdToken().then((value) async{
         print('token iss : $value');
         await registerUser(value);
       } );
  }
    }on FirebaseAuthException catch (ex) {
      // await setTokenInSP("", "");
  emit(AuthErrorState(errorMsg: ex.message.toString()));
  }
  catch(e){
    // await setTokenInSP("", "");
      emit(AuthErrorState(errorMsg: e.toString()));
    }
  }

  // Future<void> deviceLogIn() async {
  //   try {
  //     deviceId = await PlatformDeviceId.getDeviceId;
  //     print(deviceId);
  //     emit(AddToBagGetUserIdLoadingState());
  //     try {
  //       String url = 'https://belucci-test.shop/api/device/verify?device_id=$deviceId';
  //       Response response = await post(Uri.parse(url));
  //       if (response.statusCode==200){
  //         userId =jsonDecode(response.body).toString() ;
  //         emit(AddToBagGetUserIdSuccesState());
  //       }
  //       else {
  //         print(response.statusCode);
  //         throw Exception(response.reasonPhrase);
  //       }
  //     }
  //     catch (err){
  //       emit(AddToBagGetUserIdFailState(err.toString()));
  //       print('error:$err');
  //       print('fail to add device');
  //     }
  //   } on PlatformException {
  //     deviceId = 'Failed to get deviceId.';
  //     emit(AddToBagGetUserIdFailState('Failed to get deviceId.'));
  //   }
  // }

   String? deviceToken = '';

  Future<void> deviceDetails() async{
    emit(AuthLoadingState());
    final DeviceInfoPlugin deviceInfoPlugin = new DeviceInfoPlugin();
    try {
      if (Platform.isAndroid) {
        var build = await deviceInfoPlugin.androidInfo;
        deviceToken = build.id;
        print('got device id successfully ${deviceToken}');
        //UUID for Android
      } else if (Platform.isIOS) {
        var data = await deviceInfoPlugin.iosInfo;
        deviceToken = data.identifierForVendor!;
        // UUID for iOS
      }
      print('device token iss $deviceToken');
      emit(GetDeviceInfoSuccessState(deviceTok: deviceToken ?? ''));
    } on PlatformException {
      print('Failed to get platform version');
      emit(GetDeviceInfoErrorState(errorMsg:'Failed to get platform version'));
    }
  }


  Future<void> registerUser(String? firebaseToken,) async{
    emit(AuthLoadingState());
    // try{
      await authRepository.registerUser(tok: firebaseToken,deviceToken: deviceToken ).then((value) async{
        ///put in sp
        value.fold((l) {
          print(l.errorMessage);
          CacheHelper.saveData(key: 'userToken', value: '');
          CacheHelper.saveData(key: 'userId', value: 0);
          emit(AuthErrorState(errorMsg: l.errorMessage ?? ''));
        },
                (r) {
                  CacheHelper.saveData(key: 'userToken', value: r.token);
                  CacheHelper.saveData(key: 'userId', value: r.userData.userId);
                  DioHelper.init(token: r.token);
                  emit(AuthenticatedState(user:r.userData));
                } );
      });
    // }catch(e){
    //   print(e);
    //   CacheHelper.saveData(key: 'userToken', value: '');
    //   CacheHelper.saveData(key: 'userId', value:'');
      // emit(AuthErrorState(errorMsg: e.toString()));
    // }
  }

  // Future<void> validateToken() async {
  //   try {
  //     var res = await DioHelper.dio!.post("auth/refresh");
  //     if (res.statusCode == 200) {
  //       await setToken(res.data['access_token']);
  //
  //       // await getProile();
  //     } else {
  //       await setToken("");
  //     }
  //   } catch (e) {
  //     validateToken();
  //   }
  //   emit(AuthRefereshUIState());
  // }


  Future<void> logOut() async {
  emit(AuthLoadingState());
  await authRepository.signout().then((value) {
    value.fold((l) {
      print(l.errorMessage);
      emit(AuthErrorState(errorMsg: l.errorMessage ?? ''));
    },
            (r) {
          CacheHelper.removeData(key: 'userToken');
          // .saveData(key: 'userToken', value: '');
          CacheHelper.removeData(key: 'userId');
          // DioHelper.init(token: '');
          emit(UnAuthenticatedState());
        } );
  });
  }


  void checkOtpEntered(String enteredCode){
    print(enteredCode);
    debugPrint(verificationID);
    if (enteredCode.isEmpty) {
      emit(CodeEnteredEmptyState());
  } else if (enteredCode.length < 6) {
      emit(CodeEnteredShortState());
  }
    else {
      verifyOTP(enteredCode);
      // emit

    // if (authProvider.needRegister == true) {
    //   Navigator.pushAndRemoveUntil(
    //     context,
    //     MaterialPageRoute(
    //         builder: (context) =>
    //             ProfileConfig()),
    //         (route) => false,
    //   );
    // } else {
    //   Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(
    //         builder: (context) =>
    //             HomePage()),
    //   );
    //   authProvider.notif();
    // }
  }
  }

}
