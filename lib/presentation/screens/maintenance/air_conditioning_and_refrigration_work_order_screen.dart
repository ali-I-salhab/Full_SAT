import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:osta/core/extensions/app_navigator.dart';
import 'package:osta/core/localization/app_localizations.dart';
import 'package:osta/presentation/components/app_button.dart';
import 'package:osta/presentation/components/app_text_field.dart';
import 'package:osta/presentation/components/cleaning_orders_components/custom_radio_button.dart';
import 'package:osta/presentation/components/custom_app_bar.dart';
import 'package:osta/presentation/components/join_application_components/label_text.dart';
import 'package:osta/presentation/components/more_details_row.dart';
import 'package:osta/presentation/components/order_components/appointment_booking_widget.dart';
import 'package:osta/presentation/components/order_components/service_type_card.dart';
import 'package:osta/presentation/components/upload_multiple_images_widget.dart';
import 'package:osta/presentation/router/routes.dart';

class AirConditioningAndRefrigrationWorkOrderScreen extends StatelessWidget {
  const AirConditioningAndRefrigrationWorkOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(title: 'common.order_details'.tr(context)),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 32.w),
          child: Column(
            children: [
              SizedBox(height: 16.h,),
              ServiceTypeCard(serviceType: 'maintenance.air_conditioning_n_refrigeration'.tr(context)),
              SizedBox(height: 32.h,),
              CustomRadioButton(radioTitle: 'maintenance.maintenance_fix'.tr(context), radioVal: 'Underground', groupVal: 'Underground'),
              CustomRadioButton(radioTitle: 'maintenance.installation_establishment'.tr(context), radioVal: 'Underground', groupVal: 'Underground'),
              CustomRadioButton(radioTitle: 'common.both'.tr(context), radioVal: 'Underground', groupVal: 'Underground'),
              SizedBox(height: 32.h,),

              LabelText(labelText: 'maintenance.device_type'.tr(context),padding: 30,),
              SizedBox(height: 16.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(child: CustomRadioButton(radioTitle: 'maintenance.central'.tr(context), radioVal: 'both', groupVal: 'both',padding: 2,)),
                  Expanded(child: CustomRadioButton(radioTitle: 'maintenance.separate'.tr(context), radioVal: 'both', groupVal: 'both',padding: 2,)),
                  Expanded(child: CustomRadioButton(radioTitle: 'common.both'.tr(context), radioVal: 'both', groupVal: 'both',padding: 2,)),
                ],
              ),
              SizedBox(height: 32.h,),
              LabelText(labelText: 'maintenance.device_type'.tr(context),padding: 30,),
              SizedBox(height: 16.h,),
              CustomRadioButton(radioTitle: 'maintenance.window_air_conditioner'.tr(context), radioVal: 'Underground', groupVal: 'Underground'),
              CustomRadioButton(radioTitle: 'maintenance.separate_air_conditioner_two_pieces'.tr(context), radioVal: 'Underground', groupVal: 'Underground'),
              CustomRadioButton(radioTitle: 'maintenance.ceiling_cassette'.tr(context), radioVal: 'Underground', groupVal: 'Underground'),
              CustomRadioButton(radioTitle: 'maintenance.portable_air_conditioner'.tr(context), radioVal: 'Underground', groupVal: 'Underground'),
              CustomRadioButton(radioTitle: 'maintenance.package_unit'.tr(context), radioVal: 'Underground', groupVal: 'Underground'),
              CustomRadioButton(radioTitle: 'maintenance.schiller_unit_water'.tr(context), radioVal: 'Underground', groupVal: 'Underground'),


              SizedBox(height: 32.h,),
              LabelText(labelText: 'maintenance.quantities_required'.tr(context)+'maintenance.length_width'.tr(context)+' :',),
              SizedBox(height: 16.h,),
              AppTextField(inputType: TextInputType.number,),
              SizedBox(height: 32.h,),
              LabelText(labelText: 'maintenance.size_and_capacity_tons'.tr(context)+'maintenance.length_width'.tr(context)+' :',),
              SizedBox(height: 16.h,),
              AppTextField(maxLines:5,height: 102.h),

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
        ),
      ),
    );

  }
}
