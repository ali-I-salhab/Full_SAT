import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:osta/core/utils/app_text_styles.dart';
import 'package:osta/presentation/components/join_application_components/label_text.dart';

class TitleSubtitleDetail extends StatelessWidget {
  const TitleSubtitleDetail({super.key,required this.title,required this.subtitle,this.padding});
  final String title;
  final String subtitle;
  final double? padding;

  @override
  Widget build(BuildContext context) {
    return             Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FittedBox(child: Text(title,style: AppTextStyles.title3TextStyle,)),
        SizedBox(height: 8.h,),
        FittedBox(child: Text(subtitle,style: AppTextStyles.title4TextStyle,)),
      ],
    );
  }
}
