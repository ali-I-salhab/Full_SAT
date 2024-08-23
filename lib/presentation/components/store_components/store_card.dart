import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:osta/core/constants/app_colors.dart';
import 'package:osta/core/extensions/app_sizes.dart';
import 'package:osta/core/localization/app_localizations.dart';
import 'package:osta/core/utils/app_text_styles.dart';
import 'package:osta/data/models/store_model.dart';
import 'package:osta/presentation/components/join_application_components/label_text.dart';
import 'package:osta/presentation/components/long_centered_text.dart';

class StoreInfoCard extends StatelessWidget {
  const StoreInfoCard({super.key,required this.store});
  final StoreModel store;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.r)),
      margin: EdgeInsets.symmetric(vertical: 8.h),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(10.0.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 1.w,color: AppColors.primaryColor,),
                        borderRadius: BorderRadius.circular(50.r),
                      ),
                      // padding: EdgeInsets.all(4.h),
                      height: 74.h,width: 74.w,
                      child: Center(
                        child:store.storeLogo != null ?
                             Image.network(store.storeLogo,height: 50.h,width: 50.w,)
                            : Image.asset('assets/images/group.png',height: 50.h,width: 50.w,),
                      ),
                    ),
                   SizedBox(width: 12.w,),
                   LabelText(labelText:store.storeName,),
                  ],
                ),
                SizedBox(height: 8.h,),
                LabelText(labelText: 'store.description'.tr(context),),
                SizedBox(height: 4.h,),
                Text(
                  store.storeDesc ?? ''
                  // 'Lorem ipsum dolor sit amet consectetur. Sit aenean faucibus vel odio tristique porttitor egestas vitae ipsum.'
                  ,softWrap: true,style: AppTextStyles.title4TextStyle,
                  maxLines: 5,
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.ellipsis,
                )
                // LongCenteredText(text: 'Lorem ipsum dolor sit amet consectetur. Sit aenean faucibus vel odio tristique porttitor egestas vitae ipsum.',padding: 12,isCenter: false,)
              ],
            ),
          ),
          Align(
          // Positioned(
          //     top: 0,
          //     right: 0,
            alignment: AlignmentDirectional.topEnd,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10,horizontal: 14.h),
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.
                // all(Radius.circular(6.r))
              only(topRight: Radius.circular(6.r),topLeft: Radius.circular(6.r))
            ),
                width: 90.w,height: 48.h,
                child: Center(child: FittedBox(fit: BoxFit.cover,
                  child: Text(
                    store.storeSpecialization
                    // 'common.store'.tr(context)
                    ,style: AppTextStyles.title2TextStyle.copyWith(color: Colors.white),
                  softWrap: true,
                  ),
                )),
          ))
        ],
      ),
    );
  }
}
