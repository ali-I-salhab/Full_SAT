import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:osta/core/localization/app_localizations.dart';
import 'package:osta/core/utils/app_text_styles.dart';

class SubmitTitleRow extends StatelessWidget {
  const SubmitTitleRow({super.key,required this.joinSvg});
  final String joinSvg;

  @override
  Widget build(BuildContext context) {
    return    Container(
      width: double.infinity,
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32.w,vertical: 8.0.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(right: 16.w),
              child: SvgPicture.asset(
                 joinSvg ,
                  width: 40.w,height: 24.h,
                fit: BoxFit.cover,
              )
            ),
            Text("\""+'join_us.submit_your_application'.tr(context) + "\"",style: AppTextStyles.title3TextStyle,)
          ],
        ),
      ),
    );
  }
}
