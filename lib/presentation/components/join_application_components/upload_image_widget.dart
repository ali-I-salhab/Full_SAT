import 'dart:io';
import 'dart:math';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:osta/core/extensions/app_sizes.dart';
import 'package:osta/logic/join_us/join_us_cubit/join_us_cubit.dart';

class UploadWidget extends StatelessWidget {
   UploadWidget({super.key,required this.isCircleWidget, this.onTap,this.pickedmage});
  final bool isCircleWidget ;
  final Function()? onTap;
  final File? pickedmage;

  @override
  Widget build(BuildContext context) {
    return InkWell(

        onTap: onTap,
      child: Center(
        child:DottedBorder(
            borderType: isCircleWidget ? BorderType.Circle : BorderType.RRect,
            color: Colors.grey,
            strokeWidth: 1,strokeCap: StrokeCap.butt,dashPattern: [5, 5,],
            child: Container(
                width:isCircleWidget ? 204.w : 364.w,
                height: isCircleWidget ? 204.w: 117.h,
                child:isCircleWidget && pickedmage != null ?
                    Image.file(pickedmage!,fit: BoxFit.cover,)
                    : Icon(Icons.add,size: 40.w,))),
      ),
    );
  }
}
