import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:osta/core/localization/app_localizations.dart';
import 'package:osta/core/utils/app_text_styles.dart';
import 'package:osta/presentation/components/custom_app_bar.dart';
import 'package:osta/presentation/components/join_application_components/label_text.dart';
import 'package:osta/presentation/components/notification_tile.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int cc = 5;
    return SafeArea(child: Scaffold(
      appBar: CustomAppBar(title: 'setting.notifications'.tr(context)),
      body: Card(
            color: Colors.white,
            margin: EdgeInsets.only(top: 32.h),
            elevation: 0,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(40.r),topRight: Radius.circular(40.r))),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.w,vertical: 16.h),
              child:cc==0 ?
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(50.r),
                      child: Image.asset('assets/images/notification.png',height:158.h,width:158.w,fit:BoxFit.cover)),
                  SizedBox(height: 24.h,),
                  Text('setting.there_are_no_notifications_currently',softWrap: true,maxLines: 3,textAlign: TextAlign.center,style: AppTextStyles.labelTextStyle,)
                ],
              )
              :Column(
                children: [
                  Expanded(child: ListView.separated(
                      shrinkWrap:  true,
                      physics: BouncingScrollPhysics(),
                      itemCount:5,
                      itemBuilder: (context,index){
                        return NotificationTile();
                      },
                  separatorBuilder: (context,index){
                       return Column(
                         children: [
                           SizedBox(height: 16.h,),
                           Divider(
                             thickness: 1,
                           ),
                           SizedBox(height: 16.h,),
                         ],
                       );
                  },
                  ))
                ],
              ),
            ),


        ),

    ));
  }
}
