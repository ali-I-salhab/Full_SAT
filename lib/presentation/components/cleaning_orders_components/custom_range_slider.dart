import 'package:flutter/material.dart';
import 'package:osta/core/constants/app_colors.dart';

class CustomSlider extends StatelessWidget {
  const CustomSlider({super.key,this.division,
    this.sliderValue,
    this.min,this.max,
    this.onChanged
  });
  final int? division;
  final double? sliderValue;
  final double? min;
  final double? max;
  final Function(double)? onChanged ;


  @override
  Widget build(BuildContext context) {
    return Slider(
      value: sliderValue ?? 0.0,
      min:min ?? 0,
      max: max ?? 100,
      divisions: max?.round() ?? null,
      activeColor: AppColors.secondaryColor,
      inactiveColor: AppColors.secondaryColor,
      label: sliderValue.toString() ?? '',
      allowedInteraction: SliderInteraction.tapAndSlide,
mouseCursor: MouseCursor.defer,
thumbColor: Colors.white,
      onChanged:onChanged

    );
  }
}
