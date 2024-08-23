import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:osta/core/utils/app_text_styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;


  @override
  final Size preferredSize;

  CustomAppBar({required this.title,this.actions})
      : preferredSize = Size.fromHeight(60.h);
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w,),
    child: AppBar(
      title:
      // Padding(
      //   padding: EdgeInsets.symmetric(horizontal: 32.w,),
        // child:
      Text(title,style: AppTextStyles.labelTextStyle,),
      // ),
      actions: actions ?? [],
    )
      );
  }
}