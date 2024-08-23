import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:osta/core/localization/app_localizations.dart';
import 'package:osta/core/utils/app_text_styles.dart';
import 'package:osta/presentation/components/order_components/title_subtitle_detail.dart';

class TenderOfferCard extends StatelessWidget {
  const TenderOfferCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.r)),
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          // mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FittedBox(
                    child: Text(
                  'tender.tender_type'.tr(context) + ' : ',
                  style: AppTextStyles.textStyle14Medium,
                )),
                SizedBox(
                  width: 8.w,
                ),
                FittedBox(
                    child: Text(
                  'construction tender',
                  style: AppTextStyles.title4TextStyle,
                )),
              ],
            ),
            SizedBox(
              height: 16.h,
            ),
            Divider(
              thickness: 2,
            ),
            SizedBox(
              height: 16.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FittedBox(
                  child: Text('tender.details'.tr(context) +' : ',
                      style: AppTextStyles.textStyle14Medium),
                ),
                Expanded(
                  child: Text(
                       'Lorem ipsum dolor sit amet consectetur. Sit aenean faucibus vel odio tristique porttitor egestas vitae ipsum.',
                       softWrap: true,
                       style: AppTextStyles.title4TextStyle,
                       maxLines: 6,
                       textAlign: TextAlign.start,
                       overflow: TextOverflow.ellipsis,
                     ),
                ),
                SizedBox(
                  width: 8.w,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
