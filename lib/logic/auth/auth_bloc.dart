import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:osta/data/repositories/auth_repository.dart';
import 'package:osta/logic/auth/auth_state.dart';
import '././auth_event.dart';


class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthRepository authRepository = AuthRepository();
  UserCredential? userCredential;

  AuthBloc() : super(AuthInitialState()) {

    // on<SendOtpToPhoneEvent>((event, emit) async {
    //   emit(AuthLoadingState());
    //   try {
    //     await authRepository.sendOtp(
    //         phoneNumber: event.phoneMumber,
    //         phoneVerificationFailed: (FirebaseAuthException e) {
    //           add(OnAuthErrorEvent(errorMsg: e.toString()));
    //         },
    //         phoneVerificationCompleted: (PhoneAuthCredential credential) {
    //           add(PhoneVerificationCompletedEvent(credential: credential));
    //         },
    //         phoneCodeSent: (String verificationId, int? refreshToken) {
    //           add(PhoneCodeSentEvent(
    //               verificationId: verificationId, token: refreshToken));
    //         },
    //         autoRetrievalTimeout: (String verificationId) {});
    //   } catch (e) {
    //     emit(AuthErrorState(errorMsg: e.toString()));
    //   }
    // });

    // on<CodeSentEvent>((event, emit) async {
      // emit(AuthCodeSentState(verificationId: event.verificationId));
    // });
    //

    on<SignInWithPhoneEvent>(_signIn);
    on<SendOtpToPhoneEvent>(_sendOtp);
    on<CodeSentEvent>(_codeSent);
    on<PhoneVerificationCompletedEvent>(_phoneVerifyCompleted);
    on<OnAuthErrorEvent>(_handleError);

  }
  String? _verificationId ;

  FutureOr<void> _sendOtp(SendOtpToPhoneEvent event,Emitter<AuthState> emit) async{
    emit(AuthLoadingState());
      try {
        print(event.phoneMumber);
        await authRepository.sendOtp(
            phoneNumber: event.phoneMumber,
            phoneVerificationFailed: (FirebaseAuthException e) {
              add(OnAuthErrorEvent(errorMsg: e.toString()));
            },
            phoneVerificationCompleted: (PhoneAuthCredential credential) {
              add(PhoneVerificationCompletedEvent(credential: credential));
            },
            phoneCodeSent: (String verificationId, int? refreshToken) {
              print(verificationId);
              add(CodeSentEvent(verificationId: verificationId));
              //     verificationId: verificationId, token: refreshToken));
            },
            autoRetrievalTimeout: (String verificationId) {
              _verificationId = verificationId;
              emit(AuthCodeSentState());
            });
      } catch (e) {
        emit(AuthErrorState(errorMsg: e.toString()));
      }
  }

  FutureOr<void> _codeSent(CodeSentEvent event,Emitter<AuthState> emit) {
    _verificationId = event.verificationId ;
      emit(AuthCodeSentState());
  }

  FutureOr<void> _phoneVerifyCompleted(PhoneVerificationCompletedEvent event,Emitter<AuthState> emit) async{
      try{
        await authRepository.signInWithPhone(event.credential).then((value) {
         emit(AuthCodeSentState());
         // emit(AuthenticatedState());
        });
      }catch(e){
        emit(AuthErrorState(errorMsg: e.toString()));
      }
  }

  FutureOr<void> _signIn(SignInWithPhoneEvent event,Emitter<AuthState> emit) async{
    try {
      UserCredential userCredential = await authRepository.signInWithPhone(event.credential);
      if(userCredential.user != null) {
        // emit( AuthenticatedState());
      }
    } on FirebaseAuthException catch(ex) {
      emit( AuthErrorState(errorMsg: ex.message.toString()) );
    }
  }


  FutureOr<void> _handleError(OnAuthErrorEvent event,Emitter<AuthState> emit) {
      emit(AuthErrorState(errorMsg: event.errorMsg));
  }

}
