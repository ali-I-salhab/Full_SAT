import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:osta/core/extensions/app_navigator.dart';
import 'package:osta/core/localization/app_localizations.dart';
import 'package:osta/presentation/components/app_button.dart';
import 'package:osta/presentation/components/app_text_field.dart';
import 'package:osta/presentation/components/custom_app_bar.dart';
import 'package:osta/presentation/components/join_application_components/app_drop_down.dart';
import 'package:osta/presentation/components/join_application_components/label_text.dart';
import 'package:osta/presentation/components/more_details_row.dart';
import 'package:osta/presentation/components/order_components/appointment_booking_widget.dart';
import 'package:osta/presentation/components/upload_multiple_images_widget.dart';
import 'package:osta/presentation/router/routes.dart';

class GasOrderScreen extends StatelessWidget {
  const GasOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(title: 'common.gas'.tr(context)),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 32.w),
          child: Column(
            children: [
              SizedBox(height: 32.h,),
              LabelText(labelText: 'order_details.address_type'.tr(context)),
              SizedBox(height: 16.h,),
              AppDropDown(items: ['order_details.hotel'.tr(context), 'order_details.house'.tr(context), 'order_details.restaurant'.tr(context),'order_details.lab'.tr(context),'order_details.company'.tr(context),'order_details.store'.tr(context)]),
              SizedBox(height: 32.h,),
              LabelText(labelText: 'gas.how_many_gas_cans_do_you_need'.tr(context)),
              SizedBox(height: 16.h,),
              AppTextField(inputType: TextInputType.number,),
              SizedBox(height: 32.h,),
              LabelText(labelText: 'maintenance.quantities_required'.tr(context)),
              SizedBox(height: 16.h,),
              AppTextField(inputType: TextInputType.number,),
              SizedBox(height: 32.h,),
              MoreDetailsRow(),
              SizedBox(height: 16.h,),
              AppTextField(maxLines:5,height: 102.h),
              SizedBox(height: 24.h,),
              Divider(
                thickness: 2,
              ),
              SizedBox(height: 24.h,),
              MoreDetailsRow(isAddPictures: true,),
              SizedBox(height: 16.h,),
              UploadMultipleImagesWidget(),
              SizedBox(height: 24.h,),
              Divider(thickness: 2,
              ),
              SizedBox(height: 24.h,),
              AppointmentBookingWidget(),
              SizedBox(
                height:86.h,
              ),
              AppButton(
                  onTap: () {
                    context.navigateTo(
                        routeName: Routes.orderCostDetailsViewRoute);
                  },
                  buttonText: 'common.next'.tr(context)),
              SizedBox(
                height: 53.h,
              ),

            ],
          ),
        ) ,
      ),
    );

  }
}
