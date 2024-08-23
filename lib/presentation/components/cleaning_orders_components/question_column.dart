import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:osta/core/extensions/app_sizes.dart';
import 'package:osta/core/localization/app_localizations.dart';
import 'package:osta/presentation/components/cleaning_orders_components/custom_radio_button.dart';
import 'package:osta/presentation/components/join_application_components/label_text.dart';

class QuestionColumn extends StatelessWidget {
  const QuestionColumn({super.key,required this.questionText});
  final String questionText;

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        LabelText(labelText: questionText,padding: 0,),
        SizedBox(height: 16.h,),
        CustomRadioButton(radioTitle: 'common.yes'.tr(context), radioVal: 'yes', groupVal: 'yes',padding: 2,),
        CustomRadioButton(radioTitle: 'common.no'.tr(context), radioVal: 'yes', groupVal: 'no',padding:2,),
      ],
    );
  }
}
