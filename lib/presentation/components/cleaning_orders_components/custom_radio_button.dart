import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:osta/core/constants/app_colors.dart';
import 'package:osta/presentation/components/join_application_components/label_text.dart';

class CustomRadioButton extends StatelessWidget {
   CustomRadioButton({super.key,this.padding,this.onChanged,required this.radioTitle,required this.radioVal,required this.groupVal,this.isSelected});
  final String radioTitle;
  final String radioVal;
   String groupVal;
  final double? padding;
  final bool? isSelected;
   void Function(String? val)? onChanged;


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: RadioListTile(
              value: radioVal,
              groupValue: groupVal,
              onChanged: onChanged,
           activeColor: AppColors.primaryColor,
           enableFeedback: true,
            visualDensity: VisualDensity(horizontal: -4, vertical: -4),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
           contentPadding: EdgeInsets.zero,
            toggleable: true,
            selected: isSelected ?? false,
           title: Padding(
             padding:  EdgeInsets.only(left: 5.w),
             child: LabelText(labelText: radioTitle,),
           ),
            // visualDensity: VisualDensity.comfortable,
            controlAffinity: ListTileControlAffinity.platform,
          ),
        ),
      ],
    );

}
}
