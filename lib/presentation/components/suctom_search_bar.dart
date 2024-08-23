import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:osta/core/constants/app_colors.dart';
import 'package:osta/core/extensions/app_sizes.dart';

class CustomSearchbar extends StatelessWidget {
  const CustomSearchbar({super.key});

  @override
  Widget build(BuildContext context) {
    return           SizedBox(
      // width: context.width * 0.95,
      height: 40.h,
      child: SearchBar(
        backgroundColor: MaterialStateProperty.all(Colors.transparent),
        elevation: MaterialStateProperty.all(0),
        leading: Icon(
          Iconsax.search_normal_1_copy,
          size: 24.w,
        ),
        // padding: MaterialStateProperty.all(
        //     EdgeInsets.symmetric(horizontal: 16)),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
            side: BorderSide(color: AppColors.secondaryColor))),
      ),
    );
  }
}
