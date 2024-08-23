import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NumericRangeFormatter extends TextInputFormatter {

  final double min;
  final double? max;

  NumericRangeFormatter({required this.min, required this.max});

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue,
      TextEditingValue newValue,) {
    if(newValue.text == '')
      return TextEditingValue();
    else if(int.parse(newValue.text) < min)
      return TextEditingValue().copyWith(text: min.toString());

    return int.parse(newValue.text) > max! ? TextEditingValue().copyWith(text: max.toString()) : newValue;

  }
}