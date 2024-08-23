import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:osta/core/constants/app_colors.dart';
import 'package:osta/core/utils/app_text_styles.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key,required this.title,required this.image});
  final String title;
  final String image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 174.h,
      width: 174.w,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.r),
        ),
        color: Colors.white,
        // margin: EdgeInsets.all(5),
        elevation: 2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Padding(
                // margin: EdgeInsets.all(12),
                padding: EdgeInsets.symmetric(horizontal: 25.w,vertical: 10.h),
                //   height: 124.h,
                //   width: 124.w,
                  // width: MediaQuery.of(context).size.width * 0.25,
                  child: image.split('/')[0] !='assets'
                      ? CachedNetworkImage(imageUrl: image,fit: BoxFit.cover,fadeInCurve: Curves.bounceInOut,
                    width: 124.w,height: 124.h,
                    errorWidget: (context,_,$) => Icon(Icons.error_outline_outlined,color: AppColors.primaryColor,size: 30.w,),
                    placeholder:(context,_) => CircularProgressIndicator(color: AppColors.primaryColor,),

                  )
                      : Image.asset(
                  image,
                    fit: BoxFit.cover,
                    )
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 8.h),
              child: Text(
               title,
                style: AppTextStyles.title2TextStyle
              ),
            )
          ],
        ),
      ),
    );
  }
}
