import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:osta/core/constants/app_colors.dart';
import 'package:osta/core/extensions/app_sizes.dart';
import 'package:osta/core/utils/app_text_styles.dart';
import 'package:osta/data/models/main_service_model.dart';

class StoreCategoryItem extends StatelessWidget {
  const StoreCategoryItem({super.key, this.cat,this.isSelected});
  final MainService? cat;
  final bool? isSelected;

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        color:isSelected == true ? AppColors.primaryColor: Colors.transparent,
          borderRadius: BorderRadius.circular(30.r),
        border: Border.all(color: AppColors.primaryColor,width: 1.w,),
      ),
      height: 40.h,
        // width: 71.w,
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      margin: EdgeInsets.symmetric( horizontal: 4.w),
      child:
      Center(child: Text(cat?.serviceName ?? 'category',style: AppTextStyles.title2TextStyle.copyWith(
        color: isSelected == true? Colors.white : AppColors.textColor
      ),),)
    );

  }
}
