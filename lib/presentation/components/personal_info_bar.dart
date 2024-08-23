import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:osta/core/constants/app_colors.dart';
import 'package:osta/core/utils/app_text_styles.dart';
import 'package:osta/data/models/user_model.dart';
import 'package:osta/logic/auth/auth_cubit.dart';
import 'package:osta/logic/auth/auth_state.dart';
import 'package:osta/logic/profile/profile_cubit.dart';
import 'package:osta/logic/profile/profile_state.dart';

class PersonalInfoBar extends StatelessWidget {
  const PersonalInfoBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
ProfileCubit profileCubit = ProfileCubit.get(context);
final UserModel? userInfo = profileCubit.user ;
        return Row(
          children: [
            SizedBox(
              height: 52.h,
              width: 52.w,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(35.r),
                child:
                userInfo?.image != null
                ?
                // Image.file(File.fromUri(Uri.parse(userInfo!.image!)),
                Image.network(userInfo!.image!,
                  fit: BoxFit.cover,
                  width: 52.h,)
                    :
                Image.asset(
                  'assets/images/profile.png', fit: BoxFit.cover,
                  width: 52.h,),
              ),
            ),
            SizedBox(width: 18.w,),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Hello ${userInfo?.name ?? ' '}', style: AppTextStyles.labelTextStyle,),
                SizedBox(height: 8.h,),
                Wrap(children: [
                  Icon(Iconsax.location_copy, size: 20.w,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0.w,),
                    child: Text(userInfo?.addressDescription ?? ' ',
                      style: AppTextStyles.title2TextStyle,),
                  ),
                ]
                ),
              ],
            ),
            Spacer(),
            SizedBox(
              height: 52.h, width: 52.h,
              child: IconButton(onPressed: () {},
                  padding: EdgeInsets.zero,
                  icon: CircleAvatar(
                    foregroundColor: AppColors.secondaryColor,
                    backgroundColor: Colors.white,
                    radius: 32.r,
                    child: Icon(Iconsax.notification_copy,),)),
            )

          ],
        );
      },
    );
  }
}
