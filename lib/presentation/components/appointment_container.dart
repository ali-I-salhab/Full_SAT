import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:osta/core/constants/app_colors.dart';
import 'package:osta/core/extensions/app_sizes.dart';
import 'package:osta/core/utils/app_text_styles.dart';
import 'package:osta/presentation/components/join_application_components/label_text.dart';
import 'package:osta/presentation/components/order_components/title_subtitle_detail.dart';

class AppointmentContainer extends StatelessWidget {
  const AppointmentContainer({super.key,required this.title,required this.subtitle,required this.icon,required this.onTap,this.isChosen});
  final String title;
  final String subtitle;
  final IconData icon;
  final Function() onTap;
  final bool? isChosen ;

  @override
  Widget build(BuildContext context) {
    return
      GestureDetector(
        onTap: onTap,
        child: Container(
          width: 169.w,
          height: 52.h,
          // margin: EdgeInsets.only(left: context.width * 0.02,),
          padding: EdgeInsets.symmetric(horizontal: 8.w,vertical: 8.h),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(color:isChosen == true ?AppColors.primaryColor :AppColors.grey),
              shape: BoxShape.rectangle),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(icon,size: 24.w,),
              Padding(
                padding:  EdgeInsets.only(left: 8.w),
                child:
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FittedBox(child: LabelText(labelText: title)),
                    // SizedBox(height: 8.h,),
                    FittedBox(child: Text(subtitle,style: AppTextStyles.textStyle12,)),
                  ],
                )
                // TitleSubtitleDetail(title: title, subtitle: subtitle),
              )
            ],
          ),
        ),
      );
  }
}
