import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:osta/core/constants/app_colors.dart';
import 'package:osta/core/utils/app_text_styles.dart';

class SettingSection extends StatelessWidget {
  const SettingSection({super.key,required this.label,required this.settingList});
  final String label;
  final List<Widget> settingList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(right: 19.w,left: 19.w,bottom: 8.0.h),
          child: FittedBox(child:Text(label,style: AppTextStyles.subTitleTextStyle,),),
        ),
        ...settingList,
      SizedBox(height: 24.h,)
      ],
    );
  }
}
