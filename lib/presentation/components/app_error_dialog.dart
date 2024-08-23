import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:osta/core/extensions/app_sizes.dart';
import 'package:osta/core/localization/app_localizations.dart';

import '../../core/constants/app_colors.dart';
import '../../logic/themes/themes_cubit.dart';

class ErrorDialog extends StatelessWidget {
  const ErrorDialog({super.key, required this.errorText,this.btnText,this.btnFunc});

  final String errorText;
  final String? btnText;
  final Function()? btnFunc;

  @override
  Widget build(BuildContext context) {
    return Center(
      child:  Container(
              height: context.height * 0.4,
              // width: context.width * 0.8,
              decoration: BoxDecoration(
                  // color: state.brightness == Brightness.light
                  //     ? Colors.white
                  //     : AppColors.darkGreyColor,
                  // borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
              // padding: EdgeInsets.symmetric(horizontal: 50.w),
              child: Center(
                  child: AlertDialog(
                      title: Text('common.something_went_wrong'.tr(context)),
                      content: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 8.h),
                        child: Text(errorText,softWrap: true,textAlign: TextAlign.start),
                      ),
                      actions: <Widget>[
                        TextButton(
                          child: Text(btnText ?? "common.ok".tr(context)),
                          onPressed: btnFunc ?? () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                      contentPadding: EdgeInsets.all(8.w))))
    );
  }
}
