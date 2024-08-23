import 'package:flutter/material.dart';
import 'package:osta/core/utils/app_text_styles.dart';

class costNameRow extends StatelessWidget {
  const costNameRow({super.key,required this.costName,required this.costDetail});
  final String costName;
  final String costDetail;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: FittedBox(child: Text(costName,style: AppTextStyles.labelTextStyle,)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: FittedBox(child: Text(costDetail,style: AppTextStyles.subtitleStyle,)),
          ),

        ],
      ),
    );
  }
}
