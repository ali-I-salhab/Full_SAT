import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:osta/core/constants/app_colors.dart';
import 'package:osta/core/localization/app_localizations.dart';
import 'package:osta/core/utils/app_text_styles.dart';

class RequestTabViewBar extends StatefulWidget {
  const RequestTabViewBar({super.key});

  @override
  State<RequestTabViewBar> createState() => _RequestTabViewBarState();
}

class _RequestTabViewBarState extends State<RequestTabViewBar> with TickerProviderStateMixin{

  // TabController tabController = TabController(length: 3, vsync: this );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: Card(
        // margin: EdgeInsets.all(16),
        // decoration: BoxDecoration(
          color: Colors.white,
shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular(6.r),
        ),
        elevation: 2,
        child: TabBar(
          // controller: tabController,
            enableFeedback: true,
           onTap: (int i){},
            dividerColor: AppColors.lightBackgroundColor,
            unselectedLabelStyle:AppTextStyles.titleTextStyle.copyWith(fontSize: 14.sp),
            unselectedLabelColor: AppColors.secondaryColor,
            indicator: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(6.r),
            shape: BoxShape.rectangle,
            ),
isScrollable: false,

            splashBorderRadius: BorderRadius.circular(6.r),
            indicatorColor: AppColors.primaryColor,
            indicatorSize: TabBarIndicatorSize.tab,
            labelColor: Colors.white,
            labelStyle:AppTextStyles.titleTextStyle.copyWith(color: Colors.white,fontSize: 14.sp),

            tabs: [
              Tab(child: Text('requests.in_progress'.tr(context)),),
              Tab(child: Text('requests.completed'.tr(context)),),
              Tab(child: Text('requests.rejected'.tr(context)),),
            ]),
      ),
    );
  }
}
