import 'package:flutter/material.dart';
import 'package:osta/core/extensions/app_sizes.dart';
import 'package:osta/core/utils/app_text_styles.dart';

class DetailsRow extends StatelessWidget {
  const DetailsRow({super.key,required this.detailName,required this.detailData});
  final String detailName;
  final String detailData;

  @override
  Widget build(BuildContext context) {
    return           Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FittedBox(child: Text('$detailName:',style: AppTextStyles.labelSmallTextStyle,),),
        SizedBox(width: context.width*0.05,),
        FittedBox(child: Text(detailData,style: AppTextStyles.title3TextStyle,))
      ],
    );
  }
}

