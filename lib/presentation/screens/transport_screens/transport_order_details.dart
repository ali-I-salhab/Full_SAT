import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:osta/core/extensions/app_navigator.dart';
import 'package:osta/core/extensions/app_sizes.dart';
import 'package:osta/core/localization/app_localizations.dart';
import 'package:osta/presentation/components/app_button.dart';
import 'package:osta/presentation/components/app_text_field.dart';
import 'package:osta/presentation/components/custom_app_bar.dart';
import 'package:osta/presentation/components/join_application_components/label_text.dart';
import 'package:osta/presentation/components/order_components/main_details_card.dart';
import 'package:osta/presentation/components/payment_button.dart';
import 'package:osta/presentation/router/routes.dart';

class TransportOrderDetails extends StatelessWidget {
  const TransportOrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(title: 'common.order_details'.tr(context)),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 32.w),
          child: Column(
            children: [
              SizedBox(height: 32.h,),
              MainDetailsCard(),
              SizedBox(height: 32.h,),
              LabelText(labelText: 'transport.cost_per_move'.tr(context)),
              SizedBox(height: 16.h,),
              AppTextField(hintText: '20.00 IDQ,'),
              SizedBox(height: 200.h),
              PaymentButton(onTap: (){}, buttonText: ' '),
              SizedBox(height: 16.h,),
              AppButton(onTap: (){
                context.navigateTo(routeName: Routes.waitingViewRoute);
              }, buttonText: 'order_details.order_now'.tr(context)),
              SizedBox(height: 72.h,),

            ],
          ),
        ),
      ),
    );
  }
}
