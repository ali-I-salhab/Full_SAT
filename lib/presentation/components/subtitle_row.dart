
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:osta/core/localization/app_localizations.dart';
import 'package:osta/core/utils/app_text_styles.dart';
import 'package:osta/presentation/components/join_application_components/label_text.dart';


class SubtitleRow extends StatelessWidget {
  SubtitleRow({Key? key,required this.subtitle ,this.onTap}) : super(key: key);
  String subtitle;
  Function()? onTap;
  double? padding;

  @override
  Widget build(BuildContext context) {
    return
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(subtitle,style: AppTextStyles.label1TextStyle,softWrap: true,maxLines: 3,),
    onTap != null ? InkWell(child:FittedBox(child: Text('common.see_all'.tr(context),style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w400,),softWrap: true,))
    ):Container()
      ],
    );

    //   Padding(
    //   padding: EdgeInsets.only(left: 2),
    //   child: FittedBox(
    //     child: Row(
    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //     Container(
    //     margin: EdgeInsets.all(15),
    //     child: SizedBox(
    //       child: Text(
    //         subtitle,
    //         style: TextStyle(
    //             fontSize: 20,
    //          fontWeight :FontWeight.w700),
    //       ),
    //     ),),
    //      onTap != null ? InkWell(
    //           onTap:onTap,
    //           child: Text('see more', style: TextStyle(
    //             fontSize: 20,
    //           ),),
    //         ): Container(),
    //
    //       ],
    //     ),
    //   ),
    // );
  }
}
