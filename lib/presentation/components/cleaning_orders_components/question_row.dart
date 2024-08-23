import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:osta/core/extensions/app_sizes.dart';
import 'package:osta/presentation/components/cleaning_orders_components/custom_radio_button.dart';
import 'package:osta/presentation/components/join_application_components/label_text.dart';

class QuestionRaw extends StatelessWidget {
  const QuestionRaw({super.key,required this.questionText});
  final String questionText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(flex: 2,child: LabelText(labelText: questionText,padding: 0,)),
       SizedBox(width: 27.w,),
        Expanded(flex:1,child: CustomRadioButton(radioTitle: 'yes', radioVal: 'yes', groupVal: 'yes',padding: 2,)),
        Expanded(flex:1,child: CustomRadioButton(radioTitle: 'No', radioVal: 'yes', groupVal: 'yes',padding:2,)),
      ],
    );
  }
}
