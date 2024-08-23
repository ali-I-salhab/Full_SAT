import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:osta/core/constants/app_colors.dart';
import 'package:osta/core/extensions/app_navigator.dart';
import 'package:osta/core/localization/app_localizations.dart';
import 'package:osta/core/utils/app_text_styles.dart';
import 'package:osta/core/utils/nav_bar_enum.dart';
import 'package:osta/logic/navigation_cubit/navigation_cubit.dart';
import 'package:osta/presentation/components/app_button.dart';
import 'package:osta/presentation/components/app_outlined_button.dart';
import 'package:osta/presentation/components/join_application_components/label_text.dart';
import 'package:osta/presentation/router/routes.dart';

class TenderOfferDialog extends StatelessWidget {
  const TenderOfferDialog({super.key});

  @override
  Widget build(BuildContext context) {
    // return SizedBox(
    //   height: 295.h,
    //   width: 364.w,
    //   child: Dialog(
    //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.r)),
    //     elevation: 2,
    //     child: Padding(
    //       padding: EdgeInsets.symmetric(horizontal: 12.w),
    //       child: Column(
    //         crossAxisAlignment: CrossAxisAlignment.center,
    //         children: [
    //           SizedBox(height: 30.h,),
    //          CircleAvatar(
    //            backgroundColor: AppColors.primaryColor,
    //            child: Image.asset('assets/images/mini_logo.png',width: 56.w,height: 56.h,),
    //          ),
    //           SizedBox(height: 14.h,),
    //           Text('tender.please_register_your_company_in_osta77_to_access_the_rest_of_the_details'.tr(context) ,
    //           style: AppTextStyles.labelTextStyle,
    //             maxLines: 5,
    //             softWrap: true,
    //           ),
    //           SizedBox(height: 28.h,),
    //           Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //             children: [
    //               AppButton(onTap: (){
    //                 BlocProvider.of<NavigationCubit>(context)
    //                     .getNavBarItem(NavBarItem.requests);
    //               }, buttonText: 'common.join_us'.tr(context) ,btnWidth: 150.w),
    //               SizedBox(width: 10.w,),
    //               AppOutlinedButton(onTap: (){}, buttonText:'common.cancel'.tr(context),btnWidth: 150.w,
    //               )
    //             ],
    //           ),
    //           SizedBox(
    //             height: 32.h,
    //           )
    //         ],
    //       ),
    //     ),
    //   ),
    // );
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.r)),
      elevation: 2,
      titlePadding: EdgeInsets.all( 12.w),
      contentPadding: EdgeInsets.symmetric(horizontal: 12.w),
      // actionsPadding: EdgeInsets.all(12.w),
      // insetPadding: EdgeInsets.all(12.w),
      title: Center(child:  CircleAvatar(
        backgroundColor: AppColors.primaryColor,
        child: Image.asset('assets/images/mini_logo.png',width: 56.w,height: 56.h,),
      ),),
      content:  Padding(
        padding:  EdgeInsets.all(12.w),
        child: Text('tender.please_register_your_company_in_osta77_to_access_the_rest_of_the_details'.tr(context) ,
          style: AppTextStyles.labelTextStyle,
          maxLines: 5,
          softWrap: true,
        ),
      ),
      actions: [
        AppButton(onTap: (){
          context.navigateAndRemoveUntil(newRoute: Routes.layoutViewRoute,arguments: 1 );
          context.read<NavigationCubit>().getNavBarItem(NavBarItem.join);
        }, buttonText: 'common.join_us'.tr(context) ,btnWidth: 150.w),
        SizedBox(width: 10.w,),
        AppOutlinedButton(onTap: (){
          context.getBack();
        }, buttonText:'common.cancel'.tr(context),btnWidth: 150.w,
        )
      ],
      alignment: Alignment.center,
    );
  }
}
