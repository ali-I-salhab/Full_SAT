import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:osta/core/extensions/app_sizes.dart';
import 'package:osta/core/localization/app_localizations.dart';
import 'package:osta/logic/join_us/join_us_cubit/join_us_cubit.dart';
import 'package:osta/logic/join_us/join_us_cubit/join_us_state.dart';
import 'package:osta/presentation/components/app_text_field.dart';

class MultipleNumberInput extends StatelessWidget {
  const MultipleNumberInput({super.key});

  @override
  Widget build(BuildContext context) {
    return             BlocBuilder<JoinUsCubit, JoinUsState>(
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AppTextField(labelText: 'common.phone_number'.tr(context),
        inputType: TextInputType.phone,
                    width: 306.w),
                IconButton(onPressed: () {
                  context.read<JoinUsCubit>().toggleAddNumber();

                }, icon: Icon(
                  context.read<JoinUsCubit>().newNumber ?
                  Icons.minimize_outlined : Icons.add_circle, size: 28.w,))
              ],),

            Visibility(
              visible: context.read<JoinUsCubit>().newNumber,
              child: Column(
                children: [ SizedBox(height:16.h),
                  AppTextField(width: 306.w,),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
