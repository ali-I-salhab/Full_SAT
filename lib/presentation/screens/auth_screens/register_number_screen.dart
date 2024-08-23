import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:osta/core/appkeys/auth_keys.dart';
import 'package:osta/core/localization/app_localizations.dart';
import 'package:osta/core/utils/app_text_styles.dart';
import 'package:osta/logic/themes/app_theme.dart';
import 'package:osta/core/extensions/app_navigator.dart';
import 'package:osta/logic/auth/auth_bloc.dart';
import 'package:osta/logic/auth/auth_state.dart';
import 'package:osta/presentation/components/app_agree_to_terms_text.dart';
import 'package:osta/presentation/components/app_button.dart';
import 'package:osta/presentation/components/app_logo_container.dart';
import 'package:osta/presentation/components/app_text_field.dart';
import 'package:osta/presentation/components/join_application_components/label_text.dart';
import 'package:osta/presentation/router/routes.dart';

import '../../../logic/auth/auth_cubit.dart';
import '../../components/app_error_dialog.dart';
import '../../components/app_loading_dialog.dart';

class RegisterNumberScreen extends StatelessWidget {
  const RegisterNumberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TextEditingController phoneController = TextEditingController();
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) async {
        if(state is AuthCodeSentState){
          context.getBack();
          context.navigateTo(routeName: Routes.verifyOtpViewRoute,arguments:context.read<AuthCubit>().phoneController.text);
        }
       else if(state is AuthLoadingState){
          showAdaptiveDialog<Widget>(
            context: context,
            barrierDismissible: false,

            builder: (context) => const LoadingDialog(),
          );
        }
        else if (state is AuthErrorState) {
          context.getBack();
          showAdaptiveDialog<Widget>(
            context: context,
            builder: (context) =>  ErrorDialog(errorText: state.errorMsg),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 32.w),
          child: Form(
            key: AuthKeys.loginFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 80.h,),
                AppLogoContainer(),
               SizedBox(height: 80.h,),
                LabelText(
labelText:                   'sign_in.enter_your_number'.tr(context),
                  // style: AppTextStyles.labelTextStyle,
                  // textAlign: TextAlign.start,

                ),
                SizedBox(height: 16.h,),
                AppTextField(
                  controller: context.read<AuthCubit>().phoneController,
                  inputType: TextInputType.phone,
                  validator: (value) {
                    value = context.read<AuthCubit>().phoneController.text;
                    print(value);
                    if (value == '' || value == null) {
                      return 'sign_in.please_enter_your_phone_number'.tr(context);
                    }
                    if (value.length < 12) {
                      return 'sign_in.please_enter_valid_number'.tr(context);
                    }
                    return null;
                  },
                  hintText: '+964**********',
                ),
                SizedBox(height: 32.h,),
                AppButton(
                    onTap: () async {
                      if (AuthKeys.loginFormKey.currentState!.validate()) {
                        await context.read<AuthCubit>().deviceDetails().then((value) =>
                        context.read<AuthCubit>().sendOTP(context.read<AuthCubit>().phoneController.text)
                        );
                        // context.read<AuthCubit>().getTimerToResend();

                        // context.navigateTo(routeName: Routes.verifyOtpViewRoute);
                      }
                    },
                    buttonText: 'sign_in.send_code'.tr(context)),
                SizedBox(height: 200.h,),
                AgreeToTermsText()
              ],

            ),
          ),
        ),
      ),
    );
  }
}
