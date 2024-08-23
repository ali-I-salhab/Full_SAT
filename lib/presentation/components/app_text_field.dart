
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart' as intl;
import 'package:osta/core/constants/app_colors.dart';
import 'package:osta/core/extensions/app_sizes.dart';
import 'package:osta/logic/themes/app_theme.dart';

class AppTextField extends StatefulWidget {
  AppTextField(
      {Key? key,

        this.width,
        this.height,
        this.validator,
        this.controller,
        this.labelText,
        this.hintText,
        this.maxLines,
        this.inputType,this.inputFormatters,
        this.onFieldSubmit,this.onSaved
      })
      : super(key: key);
  double? width;
  double? height;
  final TextEditingController? controller;
  String? Function(String?)? validator;
   Function(String val)? onFieldSubmit;
  // final VoidCallback? onFieldSubmit;
  void Function(String? val)? onSaved;
  String? labelText;
  String? hintText;
  int? maxLines;
  TextInputType? inputType;
  List<TextInputFormatter>? inputFormatters;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  String? text = '';

  bool isRTL(String text) {
    return intl.Bidi.detectRtlDirectionality(text);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 1.0),
        width: widget.width ?? 364.w,
        height: widget.height ??40.h,
        child: TextFormField(
          // obscureText:isPassword==true && BlocProvider.of<AuthCubit>(context).ispasswordVisablitiy,
          cursorColor: Theme.of(context).primaryColor,
          validator: widget.validator,
          controller: widget.controller,
          maxLines: widget.maxLines ?? 1,
          keyboardType: widget.inputType ?? TextInputType.text,
          inputFormatters: widget.inputFormatters ?? [],
          decoration: InputDecoration(
              fillColor: Colors.transparent,
              filled: true,
              contentPadding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 12.w),
              label: Text(widget.labelText ?? ''),
              hintText: widget.hintText,
              // helperText: hintText,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0.r),
                borderSide: BorderSide(color: AppColors.grey, width: 1.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color:Theme.of(context).primaryColor,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(8.r),
              ),

          ),
          textAlign: TextAlign.start,
          textDirection:isRTL(text!)? TextDirection.rtl : TextDirection.ltr,
      onChanged:
              (value) {
    setState(() {
    text = value;
    });
    widget.onFieldSubmit != null ? widget.onFieldSubmit!(value) : null ;
          },
    //       onFieldSubmitted: widget.onFieldSubmit ?? (){},
          onSaved: widget.onSaved,
        ));
  }
}