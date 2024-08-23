import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:osta/core/extensions/app_sizes.dart';
import 'package:osta/core/utils/app_text_styles.dart';

class HeaderInfoWorker extends StatelessWidget {
  const HeaderInfoWorker({super.key,required this.name,required this.jobType,this.image});
  final String? image;
  final String name;
  final String jobType;

  @override
  Widget build(BuildContext context) {
    return Row(

      children: [
        Container(
          margin: EdgeInsets.all(8),
            width: 55.w,
            height: 55.h,
            child:image != null ?
        Image.network(image!,fit: BoxFit.cover,)
                : Image.asset('assets/images/profile.png',fit: BoxFit.cover,)),
        SizedBox(width: 10.w,),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name,style: AppTextStyles.title3TextStyle
            // Theme.of(context).textTheme.headlineSmall,
            ),
            SizedBox(height: 10.h,),
            Text(jobType,style: AppTextStyles.title3TextStyle,
              // Theme.of(context).textTheme.headlineSmall,
    ),
          ],
        )
      ],
    );
  }
}
