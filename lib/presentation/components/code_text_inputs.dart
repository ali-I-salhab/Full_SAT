import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:osta/presentation/components/verify_text_form_field.dart';

import '../../logic/auth/auth_cubit.dart';
import '../../logic/auth/auth_state.dart';

class CodeTextInputs extends StatelessWidget {
  const CodeTextInputs({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        AuthCubit authCubit = AuthCubit.get(context);
        return Form(
          // key: verifyFormKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: VerifyTextFormField(
                      controller: authCubit.verifyNum1,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: VerifyTextFormField(
                      controller: authCubit.verifyNum2,
                    ),
                  ),

                  Expanded(
                    flex: 1,
                    child: VerifyTextFormField(
                      controller: authCubit.verifyNum3,
                    ),
                  ),

                  Expanded(
                    flex: 1,
                    child: VerifyTextFormField(
                      controller: authCubit.verifyNum4,
                    ),
                  ),

                  Expanded(
                    flex: 1,
                    child: VerifyTextFormField(
                      controller: authCubit.verifyNum5,
                    ),
                  ),

                  Expanded(
                    flex: 1,
                    child: VerifyTextFormField(
                      controller: authCubit.verifyNum6,
                    ),
                  ),



                ],
              ),
            ));
      },
    );
  }
}
