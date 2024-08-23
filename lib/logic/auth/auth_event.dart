
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class SendOtpToPhoneEvent extends AuthEvent{
  final String phoneMumber;
  const SendOtpToPhoneEvent({required this.phoneMumber});

  @override
  // TODO: implement props
  List<Object?> get props => [this.phoneMumber];
}

class CodeSentEvent extends AuthEvent{
  final String verificationId;
  // final int? token;
  // final String? smsCode;
  const CodeSentEvent({required this.verificationId});

  // const CodeSentEvent();
  @override
  List<Object?> get props => [verificationId];
}

class PhoneVerificationCompletedEvent extends AuthEvent{
  final AuthCredential credential;
  const PhoneVerificationCompletedEvent({required this.credential});

  @override
  // TODO: implement props
  List<Object?> get props => [this.credential];
}

class VerifyOtpEvent extends AuthEvent{
  final String otpCode;
  final String verificationId;
  const VerifyOtpEvent({required this.otpCode,required this.verificationId});

  @override
  // TODO: implement props
  List<Object?> get props => [this.otpCode,this.verificationId];
}

class SignInWithPhoneEvent extends AuthEvent{
final PhoneAuthCredential credential;
  const SignInWithPhoneEvent({required this.credential});

  @override
  // TODO: implement props
  List<Object?> get props => [this.credential];
}

class OnAuthErrorEvent extends AuthEvent{
  final String errorMsg;
  const OnAuthErrorEvent({required this.errorMsg});

  @override
  // TODO: implement props
  List<Object?> get props => [this.errorMsg];
}


