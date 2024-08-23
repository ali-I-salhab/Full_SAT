import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:osta/presentation/components/join_application_components/label_text.dart';

class NotificationTile extends StatelessWidget {
  const NotificationTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 8,vertical: 2),
      style: ListTileStyle.list,
      leading: SizedBox(
          height: 47.h,width: 47.w,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(50.r),
              child: Image.asset('assets/images/notification.png',width: 47.w,height: 47.h,fit: BoxFit.cover,))),
      title: LabelText(labelText: '''Your request No. 1234 has been confirmed by the administration and referred to the competent worker'''),
    );
  }
}
