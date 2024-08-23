import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:osta/core/constants/app_colors.dart';
import 'package:osta/core/extensions/app_sizes.dart';
import 'package:osta/logic/main_cubit/main_cubit.dart';

class UploadMultipleImagesWidget extends StatelessWidget {
  const UploadMultipleImagesWidget({super.key, this.files, this.fieldName});

  final List<PlatformFile>? files;
  final String? fieldName;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      height: 81.h,
      // width: context.width*0.2,
      // padding: EdgeInsets.all(8),
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: files != null ? files!.length + 1 : 1,
          itemBuilder: (context, index) {
            int length = files != null ? files!.length : 0;
            return index == length
                ? Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 6.h, horizontal: 4.w),
                    child: DottedBorder(
                        borderType: BorderType.RRect,
                        color: Colors.grey,
                        strokeWidth: 1,
                        strokeCap: StrokeCap.butt,
                        dashPattern: [
                          5,
                          2,
                        ],
                        radius: Radius.circular(6.r),
                        child: Container(
                            // margin: EdgeInsets.symmetric(horizontal: 8,vertical: 8),
                            height: 77.h,
                            width: 77.h,
                            child: Center(
                                child: IconButton(
                              onPressed: () async {
                                await context.read<MainCubit>().pickFile().then(
                                    (value) => context
                                            .read<MainCubit>()
                                            .userInputs[fieldName!]
                                    // !.update("value", (value) => files
                                    //     ?.map((e) => File(e.path!))
                                    //     .toList(),));
                                    = {
                                      "value": files
                                          ?.map((e) => File(e.path!))
                                          .toList(),
                                    }
                                    );
                              },
                              icon: Icon(Iconsax.cloud_plus_copy, size: 24.w),
                            )))),
                  )
                : Container(
                    // margin: EdgeInsets.symmetric(horizontal: 8),
                    child: Stack(children: [
                      Container(
                        height: 77.h,
                        width: 77.h,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 6.h, horizontal: 4.w),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(6.r),
                            child: files?[index].extension == 'jpg' ||
                                    files?[index].extension == 'jpeg' ||
                                    files?[index].extension == 'png'
                                ? Image.file(File(files?[index].path! ?? ''),
                                    fit: BoxFit.cover,
                                    width: 77.w,
                                    height: 77.h)

                                // Image.asset('assets/images/uploaded.png',fit: BoxFit.cover,width: 77.w,height: 77.h)
                                : Icon(
                                    Icons.file_present_outlined,
                                    size: 30.w,
                                  ),
                          ),
                        ),
                      ),
                      Positioned(
                          top: -12,
                          right: -12,
                          child: IconButton(
                            onPressed: () {
                              context.read<MainCubit>().removeFile(index);
                              context
                                  .read<MainCubit>()
                                  .userInputs[fieldName]!.update("value", (value) =>
                                  files?.map((e) => File(e.path!)).toList()
                              );
                              // ) = {
                              //   "value":
                              //       files?.map((e) => File(e.path!)).toList()
                              // };
                            },
                            icon: CircleAvatar(
                              backgroundColor: AppColors.primaryColor,
                              radius: 12.r,
                              child: Icon(
                                Icons.cancel_outlined,
                                color: Colors.white,
                                size: 24.w,
                              ),
                            ),
                          ))
                    ]),
                  );
          }),
    );
  }
}
