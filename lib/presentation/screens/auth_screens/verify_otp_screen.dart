import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:osta/core/extensions/app_navigator.dart';
import 'package:osta/core/localization/app_localizations.dart';
import 'package:osta/logic/profile/profile_cubit.dart';
import 'package:osta/presentation/components/app_agree_to_terms_text.dart';
import 'package:osta/presentation/components/app_button.dart';
import 'package:osta/presentation/components/app_logo_container.dart';
import 'package:osta/presentation/components/code_text_inputs.dart';
import 'package:osta/presentation/components/resend_code_timer_widget.dart';
import 'package:osta/presentation/router/routes.dart';

import '../../../logic/auth/auth_cubit.dart';
import '../../../logic/auth/auth_state.dart';
import '../../components/app_error_dialog.dart';
import '../../components/app_error_snack_bar.dart';
import '../../components/app_loading_dialog.dart';

class VerifyOtpScreen extends StatelessWidget {
  const VerifyOtpScreen({super.key, required this.phoneNumber});

  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(

      listener: (context, state) async{
        if (state is AuthenticatedState) {
          context.getBack();
          context.navigateAndRemoveUntil(
              newRoute: Routes.layoutViewRoute);
              // newRoute: Routes.profileConfigViewRoute);
          context.read<ProfileCubit>().getUserInfo();
        }
        if (state is AuthLoadingState) {
          showAdaptiveDialog<Widget>(
            context: context,
            barrierDismissible: true,
            builder: (context) => const LoadingDialog(),
          );
        }
        if (state is CodeEnteredEmptyState) {
          context.getBack();
          CustomSnackBar.show(context: context,title: '',message: 'sign_in.please_enter_verfication_code'.tr(context));
        }
        if (state is CodeEnteredShortState) {
          context.getBack();
          CustomSnackBar.show(context: context,title: '',message: 'sign_in.verification_code_should_be_6_digits'.tr(context));
        }
        if (state is CodeEnteredUnmatchState) {
          context.getBack();
          CustomSnackBar.show(context: context,title: '',message: 'sign_in.entered_code_incorrect'.tr(context));

        }
        if (state is AuthErrorState) {
          context.getBack();
          context.getBack();
          showAdaptiveDialog<Widget>(
            context: context,
            builder: (context) => ErrorDialog(errorText: state.errorMsg),
          );
        }
      },
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 32.w),
            child: Column(
              children: [
                SizedBox(
                  height: 53.h,
                ),
                const AppLogoContainer(),
                SizedBox(
                  height: 32.h,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    onPressed: () {
                      context.getBack();
                    },
                    icon: Icon(
                      Iconsax.arrow_left_2,
                      size: 24.w,
                    ),
                  ),
                ),
                 SizedBox(height: 32.h,),
                 Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'sign_in.verification'.tr(context),
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 30.sp),
                  ),
                ),
                SizedBox(height: 16.h,),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'sign_in.verification_description'.tr(context)+' ' + phoneNumber,
                    maxLines: 5,
                    softWrap: true,
                    style: TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 20.sp),
                  ),
                ),
                SizedBox(
                  height: 52.h,
                ),
                const CodeTextInputs(),
                SizedBox(height: 16.h,),
                ResendCodeTimerWidget(
                  phone: phoneNumber,
                ),
                SizedBox(
                  height: 32.h,
                ),
                AppButton(

                    onTap: () {
                      AuthCubit authCubit = AuthCubit.get(context);
                      authCubit.verificationCodeEntered =
                          authCubit.verifyNum1.text +
                              authCubit.verifyNum2.text +
                              authCubit.verifyNum3.text +
                              authCubit.verifyNum4.text +
                              authCubit.verifyNum5.text +
                              authCubit.verifyNum6.text;

                      context
                          .read<AuthCubit>()
                          .checkOtpEntered(authCubit.verificationCodeEntered);
                      // context.navigateTo(
                      //     routeName: Routes.profileConfigViewRoute);
                    },
                    buttonText: 'sign_in.verify'.tr(context)),
                SizedBox(
                  height:86.h,
                ),
                AgreeToTermsText()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//
//
//
//
//   _verifcationCodeController.text =
//       authProvider.verifyNumber1.text +
//           authProvider.verifyNumber2.text +
//           authProvider.verifyNumer3.text +
//           authProvider.verifyNumer4.text +
//           authProvider.verifyNumer5.text +
//           authProvider.verifyNumer6.text;
//   if (_verifcationCodeController
//       .text.isEmpty) {
//     showErrorSnakBar(
//         context, 'يرجى إدخال رمز التحقق ');
//   } else if (_verifcationCodeController
//       .text.length <
//       6) {
//     showErrorSnakBar(context,
//         'رمز التحقق يتألف من 6 أرقام على الأقل');
//   } else if (_verifcationCodeController
//       .text !=
//       activationCode) {
//     showErrorSnakBar(context,
//         'الرمز المدخل لا يطابق الرمز الصحيح');
//   } else if (_verifcationCodeController
//       .text ==
//       activationCode) {
//     await authProvider
//         .activationCodesCheack();
//     if (authProvider.needRegister == true) {
//       Navigator.pushAndRemoveUntil(
//         context,
//         MaterialPageRoute(
//             builder: (context) =>
//                 ProfileConfig()),
//             (route) => false,
//       );
//     } else {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(
//             builder: (context) =>
//                 HomePage()),
//       );
//       authProvider.notif();
//     }
//   }
// },
