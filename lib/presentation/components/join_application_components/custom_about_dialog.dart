import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:osta/core/constants/app_colors.dart';
import 'package:osta/core/extensions/app_navigator.dart';
import 'package:osta/core/localization/app_localizations.dart';
import 'package:osta/core/utils/app_text_styles.dart';
import 'package:osta/presentation/router/routes.dart';

class CustomAboutDialog extends StatelessWidget {
  const CustomAboutDialog({super.key,required this.aboutJoining,required this.onTap});
  final String aboutJoining;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      backgroundColor: Colors.white,
      alignment: Alignment.center,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r)),
      // insetPadding: EdgeInsets.all(10.w),
      contentPadding: EdgeInsets.symmetric(
          horizontal: 18.w, vertical: 10.h),
      children: [
        // Text('data'),
        Divider(
          height: 2,
          color: AppColors.grey,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
                onPressed: () {
                  context.getBack();
                },
                child: Text('common.cancel'.tr(context),
    style: AppTextStyles.labelTextStyle.copyWith(color: AppColors.primaryColor),)),
            SizedBox(
                height: 50.h,
                child: VerticalDivider(
                  color: AppColors.grey,
                  width: 2,
                  indent: 10,
                  endIndent: 10,
                )),
            TextButton(
                onPressed:onTap,

                child: Text('common.ok'.tr(context),
                  style: AppTextStyles.labelTextStyle.copyWith(color: AppColors.primaryColor),)),
          ],
        )
      ],

      title: Text(
      aboutJoining,
         style: AppTextStyles.subTitle1TextStyle
            .copyWith(color: AppColors.textColor),
        softWrap: true,
        maxLines: 10,
        overflow: TextOverflow.visible,
        textAlign: TextAlign.center,
        textWidthBasis: TextWidthBasis.longestLine,
        textScaleFactor: 1.0,
      ),

    );;
  }
}
