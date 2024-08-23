import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:osta/core/extensions/app_navigator.dart';
import 'package:osta/core/extensions/app_sizes.dart';
import 'package:osta/core/localization/app_localizations.dart';
import 'package:osta/core/utils/text_field_currency_formatters.dart';
import 'package:osta/presentation/components/app_button.dart';
import 'package:osta/presentation/components/app_text_field.dart';
import 'package:osta/presentation/components/custom_app_bar.dart';
import 'package:osta/presentation/components/join_application_components/app_drop_down.dart';
import 'package:osta/presentation/components/join_application_components/label_text.dart';
import 'package:osta/presentation/router/routes.dart';

class TransportOrderScreen extends StatelessWidget {
  const TransportOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(title: 'common.transport'.tr(context)),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 32.w),
          child: Column(
            children: [
              SizedBox(height: 32.h,),
              LabelText(labelText: 'order_details.address_type'.tr(context)),
              SizedBox(height: 16.h,),
              AppDropDown(items: ['order_details.hotel'.tr(context), 'order_details.house'.tr(context), 'order_details.restaurant'.tr(context),'order_details.lab'.tr(context),'order_details.company'.tr(context),'order_details.store'.tr(context)]),
              SizedBox(height: 32.h,),
            LabelText(labelText: 'transport.transfer_type'.tr(context)),
              SizedBox(height: 16.h,),
              AppDropDown(items: ['transport.furniture'.tr(context), 'transport.equipment'.tr(context), 'transport.goods'.tr(context),'transport.waste'.tr(context)]),
              SizedBox(height: 32.h,),
             LabelText(labelText: 'transport.work_type'.tr(context)),
              SizedBox(height: 16.h,),
              AppDropDown(items: ['transport.transfer_only'.tr(context), 'transport.disassembly_installation_and_transfer'.tr(context), 'transport.transfer_and_save'.tr(context)]),
              SizedBox(height: 32.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LabelText(labelText: 'common.from'.tr(context)),
                      SizedBox(height: 16.h,),
                      AppTextField(labelText: 'common.from'.tr(context),width: 174.w,),
                    ],
                  ),
                  SizedBox(width: 16.w,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LabelText(labelText: 'common.to'.tr(context)),
                      SizedBox(height: 16.h),
                      AppTextField(labelText: 'common.to'.tr(context),width:174.w,),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 32.h,),
              LabelText(labelText: 'order_details.appointment_booking'.tr(context)),
              SizedBox(height: 16.h,),
              AppTextField(labelText: '12-12-2023',),
              SizedBox(height: 32.h,),
              LabelText(labelText: 'transport.cost_per_move'.tr(context)),
              SizedBox(height: 16.h,),
              AppTextField(labelText: 'cost',
              inputType: TextInputType.number,
                inputFormatters: [
                  CurrencyInputFormatter()
                ],
              ),
              SizedBox(height: 40.h,),

            AppButton(onTap: (){
              context.navigateTo(routeName: Routes.transportOrderDetailsViewRoute);
            }, buttonText: 'transport.confirm_reservation'.tr(context)),
              SizedBox(height: 3.h,),

            ],
          ),
        ) ,
      ),
    );
  }
}
