import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:osta/core/constants/app_colors.dart';
import 'package:osta/presentation/components/join_application_components/label_text.dart';

class CustomCheckBox extends StatelessWidget {
   CustomCheckBox({super.key,required this.checkboxTitle,this.onChanged,this.value,this.price});
  final String checkboxTitle;
  // final Function(bool?)? onChanged;
   void Function(bool? val)? onChanged;
  final bool? value;
  final String? price;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        visualDensity: VisualDensity(horizontal: -4, vertical: -4),
      activeColor: AppColors.primaryColor,
        title: LabelText(labelText: checkboxTitle),
        subtitle: price!=null ? Text(price!) : null,
        contentPadding: EdgeInsets.zero,
        controlAffinity: ListTileControlAffinity.leading,
        value: value,
        onChanged: onChanged
    );
  }
}
