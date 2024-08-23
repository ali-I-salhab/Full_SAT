import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:osta/core/localization/app_localizations.dart';
import 'package:osta/presentation/components/app_text_field.dart';
import 'package:osta/presentation/components/cleaning_orders_components/custom_radio_button.dart';
import 'package:osta/presentation/components/join_application_components/label_text.dart';

class QuestionWithExplaination extends StatelessWidget {
  const QuestionWithExplaination({super.key,required this.questionText});
  final String questionText;

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        LabelText(labelText: questionText,),
        SizedBox(height: 16.h,),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: CustomRadioButton(radioTitle: 'common.yes'.tr(context), radioVal: 'yes', groupVal: 'yes',padding: 20,)),
            Expanded(child: CustomRadioButton(radioTitle: 'common.no'.tr(context), radioVal: 'yes', groupVal: 'no',padding:20,)),
          ],
        ),
        SizedBox(height: 12.h,),
        AppTextField(maxLines: 5,hintText: 'cleaning.please_write_it_in_the_field'.tr(context),height: 102.h),
      ],
    );

  }
}
