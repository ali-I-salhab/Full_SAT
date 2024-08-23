import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:osta/core/constants/app_colors.dart';
import 'package:osta/core/extensions/app_navigator.dart';
import 'package:osta/core/localization/app_localizations.dart';
import 'package:osta/core/utils/app_text_styles.dart';
import 'package:osta/logic/profile/profile_cubit.dart';
import 'package:osta/logic/profile/profile_state.dart';
import 'package:osta/presentation/components/app_button.dart';
import 'package:osta/presentation/components/app_error_dialog.dart';
import 'package:osta/presentation/components/app_loading_dialog.dart';
import 'package:osta/presentation/components/join_application_components/label_text.dart';

class EditProfileImageSheet extends StatelessWidget {
  const EditProfileImageSheet({super.key,this.profileImage});
  final String? profileImage;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileCubit, ProfileState>(
  listener: (context, state) {
    // TODO: implement listener
    if(state is DeleteProfileImageSuccessState){
      context.getBack();
      context.getBack();
    }
    else if(state is DeleteProfileImageLoadingState){
      showAdaptiveDialog<Widget>(
        context: context,
        barrierDismissible: false,
        builder: (context) => const LoadingDialog(),
      );
    }
    else if (state is DeleteProfileImageErrorState) {
      context.getBack();
      showAdaptiveDialog<Widget>(
        context: context,
        builder: (context) =>  ErrorDialog(errorText: state.errorMsg),
      );
    }
    if(state is PickImageFromGallery){
      context.getBack();
    }
  },
  child: SafeArea(
      child: Container(
        color: Colors.transparent,
        // height: .h,
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(16.r),topRight:Radius.circular(16.r), )),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 36.h,),
                Center(child: Text('Edit your profile picture'.tr(context),style: AppTextStyles.titleTextStyle,overflow: TextOverflow.ellipsis,maxLines: 4,softWrap: true,)),
                SizedBox(height: 16.h,),
            profileImage != null?
            Column(
              children: [
                ListTile(
                      leading: Icon(Iconsax.edit_2_copy,size: 24.w),
                      title: LabelText(labelText: 'Change your profile photo'),
                      onTap: ()async{
                       await context.read<ProfileCubit>().getProfileImage();
                       // .then((value) {
                       //   if(value != null){
                       //   return context.read<ProfileCubit>().changeProfileImage(image: value).then((value) => context.getBack());
                       // }
                       // }
                       // );
                      },
                    ),
                ListTile(
                  leading: Icon(Iconsax.profile_remove_copy,size: 24.w),
                  title: LabelText(labelText: 'Delete your profile photo'),
                  onTap: ()async{
                    await context.read<ProfileCubit>().deleteProfileImage(phoneNumber: '');
                  },
                ),
              ],)
:              ListTile(
                leading: Icon(Iconsax.gallery_add_copy,size: 24.w),
                title: LabelText(labelText: 'Add your profile photo'),
    onTap: ()async{
    await context.read<ProfileCubit>().getProfileImage();
    // .then((value) {
    // if(value != null) {
    //  print(value);
    //   return context.read<ProfileCubit>().changeProfileImage(image: value);
    // }
    // });
    }
              ),
                SizedBox(
                  height: 16.h,
                ),

              ],
            ),
          ),
        ),
      ),
    ),
);
  }
}
