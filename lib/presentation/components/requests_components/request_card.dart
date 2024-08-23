import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:osta/core/constants/app_colors.dart';
import 'package:osta/core/extensions/app_sizes.dart';
import 'package:osta/core/localization/app_localizations.dart';
import 'package:osta/data/models/order_models/order_details.dart';
import 'package:osta/presentation/components/join_application_components/label_text.dart';
import 'package:osta/presentation/components/order_components/title_subtitle_detail.dart';

class RequsetCard extends StatelessWidget {
  const RequsetCard({super.key,this.isRejected = false,required this.request});
  final bool? isRejected;
  final OrderDetails request;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.r)
      ),
      elevation: 2,
      child: Padding(
        padding:  EdgeInsets.all(8.0.w),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 2.w,color: AppColors.primaryColor,),
                        borderRadius: BorderRadius.circular(50.r),
                      ),
                      // margin: EdgeInsets.all(8),
                      // padding: EdgeInsets.all(8),
                      height: 74.h,width: 74.w,
                      child: CircleAvatar(
                        // margin: EdgeInsets.all(8),
                        // width: context.width*0.2,
                        backgroundColor: Colors.transparent,
                        radius: 50.r,

                        child: ClipRRect(
                          child: Image.asset('assets/images/group.png',height: 50.h,width: 50.w,),
                        ),
                      ),
                    ),
                    SizedBox(width: 20.w,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        LabelText(labelText: 'common.service'.tr(context)+' : '+ request.formMainInfo.formType,),
                        SizedBox(height: 8.h,),
                        LabelText(labelText: 'common.id'.tr(context) + ' : '+ request.orderId.toString(),),
                        SizedBox(height: 8.h,),
                        LabelText(labelText: 'common.date'.tr(context)+' : '+request.createdAt,),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    IconButton(onPressed: (){}, icon: Icon(Iconsax.close_square_copy,color: AppColors.primaryColor,size: 24.w,)),
                    SizedBox(height: 8.h,),
                    IconButton(onPressed: (){}, icon: Icon(Iconsax.activity_copy,color: AppColors.primaryColor,size: 24.w,)),
                  ],
                )
              ],
            ),
            isRejected == true ?
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20.h,),
                    Divider(
                      indent: 20,endIndent: 20,color: AppColors.grey,thickness: 1,
                    ),
                    SizedBox(height: 16.h,),
                    TitleSubtitleDetail(title: 'requests.reason_of_refuse'.tr(context), subtitle: 'you canceled the order',)
                  ],
                )
                : Container()
          ],
        ),
      ),
    );
  }
}
