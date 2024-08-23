import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:osta/core/constants/app_colors.dart';
import 'package:osta/core/extensions/app_sizes.dart';
import 'package:osta/logic/themes/app_theme.dart';

class AppDropDown extends StatefulWidget {
  AppDropDown(
      {super.key,
      // this.categoryAttributeSchemaModel,
      required this.items,
        this.customItems,
      this.hintText,
      this.labelText,
      this.isConst = true,
      this.value,
        this.isRequired = false,
      this.onChanged,
      this.width});


  final List items;
  String? hintText;
  String? labelText;
  final bool isConst;
  double? width;
  List<DropdownMenuItem<dynamic>>? customItems;
  // ignore: prefer_typing_uninitialized_variables
  final value;
  final bool? isRequired;
  final Function(dynamic val)? onChanged;

  @override
  State<AppDropDown> createState() => _AppDropDownState();
}

class _AppDropDownState extends State<AppDropDown> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        // color: Colors.white,
        width: widget.width ?? 364.w,
        height: 40.h,
        child: DropdownButtonFormField<dynamic>(
          validator: widget.isRequired == true ? (value){
            if(value == null)
              return 'this field is required';
          else return null;
            }: null ,
          value: widget.value ,
          // isExpanded: true,
          icon: Icon(Icons.keyboard_arrow_down_outlined, size: 24.w),
          dropdownColor: Colors.white,
          borderRadius: BorderRadius.circular(8.r),
          focusColor: AppColors.textColor,
          decoration: InputDecoration(
            fillColor: Theme.of(context).primaryColor,
            focusColor: Theme.of(context).primaryColor,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0.r),
              borderSide: BorderSide(color: AppColors.grey, width: 1.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0.r),
              borderSide: BorderSide(
                color: AppTheme.lightTheme.colorScheme.primary,
                width: 1.0,
              ),
            ),
            isDense: false,
            isCollapsed: false,
            contentPadding:
                EdgeInsets.symmetric(vertical: 8.h, horizontal: 20.0.w),
            // border: OutlineInputBorder(
            //   borderSide: BorderSide(color: Theme.of(context).primaryColor,),
            //     borderRadius: BorderRadius.circular(8)),
            labelText: widget.labelText,
            labelStyle: TextStyle(color: Theme.of(context).primaryColor),
            // constraints: BoxConstraints(
            //   maxHeight: context.height * 0.04,
            //   maxWidth: context.width * 0.85,
            // )
          ),
          hint: FittedBox(
            child: Text(widget.hintText ?? ' '),
          ),
          items:widget.customItems ?? widget.items
              .map(
                (e) => DropdownMenuItem<dynamic>(
                  value: e,
                  child: Text(
                    e.toString(),
                  ),
                ),
              )
              .toList(),
          onChanged: widget.onChanged ??
              (val) {
                setState(() {
                  widget.hintText = val.toString();
                });
              },
        ));
  }
}
