import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:osta/logic/themes/app_theme.dart';

class VerifyTextFormField extends StatelessWidget {
  const VerifyTextFormField({super.key,required this.controller});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.w),
      width: 40.w,
      height: 50.h,
      child: TextFormField(
        autofocus : true,

        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly
        ],
            textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        textInputAction: TextInputAction.next,
        // autofocus = true,
        controller: controller,
        validator: (value) {
          value = controller.text;
          if (value.isEmpty) {
            return "*";
          }
          else {
            return null;
          }
        },
        onChanged: (value) {
          if (value.length == 1) FocusScope.of(context).nextFocus();
          if (value.isEmpty) FocusScope.of(context).previousFocus();
        },
        decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor,
              ),
              borderRadius: BorderRadius.all(Radius.circular(8.r))),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color:Theme.of(context).primaryColor,
              ),
              borderRadius: BorderRadius.all(Radius.circular(8.r))),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor,
              ),
              borderRadius: BorderRadius.all(Radius.circular(8.r))),
        ),
      ),
    );
  }
}
