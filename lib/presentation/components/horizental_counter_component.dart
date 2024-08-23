import 'package:flutter/material.dart';
import 'package:osta/core/constants/app_colors.dart';

class HorizentalCounterComponent extends StatelessWidget {
  const HorizentalCounterComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          radius: 15,
          backgroundColor: Colors.transparent,
          child: Icon(
            Icons.minimize_outlined,
            color: AppColors.primaryColor,
          ),
        ),
        Text('15'),
        CircleAvatar(
          radius: 15,
          backgroundColor: Colors.transparent,
          foregroundColor: AppColors.primaryColor,
          child: Icon(
            Icons.add,
            color: AppColors.primaryColor,
          ),
        )
      ],
    );
  }
}
