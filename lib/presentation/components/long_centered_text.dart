import 'package:flutter/material.dart';
import 'package:osta/core/utils/app_text_styles.dart';

class LongCenteredText extends StatelessWidget {
  const LongCenteredText({super.key,required this.text,this.padding,this.isCenter = true});
final String text;
final double? padding;
final bool? isCenter;
  @override
  Widget build(BuildContext context) {
    return        Padding(
      padding:  EdgeInsets.symmetric(horizontal:padding ?? 20.0,vertical: 8),
      child: Center(child: Text(text,softWrap: true,style: AppTextStyles.subtitleStyle.copyWith(fontSize: 18),
        maxLines: 5,
        textAlign:isCenter == true ? TextAlign.center : TextAlign.start,
        overflow: TextOverflow.ellipsis,
      )),
    );
  }
}
