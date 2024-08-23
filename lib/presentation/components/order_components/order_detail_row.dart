import 'package:flutter/material.dart';
import 'package:osta/core/utils/app_text_styles.dart';

class OrderDetailRow extends StatelessWidget {
  const OrderDetailRow({super.key,required this.icon,required this.detailTitle,required this.detailVal});
  final IconData icon;
  final String detailTitle;
  final String detailVal;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(detailTitle),
      trailing: Text(detailVal,style: AppTextStyles.subtitleStyle,),
      visualDensity: VisualDensity.compact,
    );
  }
}
