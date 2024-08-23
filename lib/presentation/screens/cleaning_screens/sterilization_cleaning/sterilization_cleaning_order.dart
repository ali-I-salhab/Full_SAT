import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:osta/core/constants/app_colors.dart';
import 'package:osta/core/extensions/app_navigator.dart';
import 'package:osta/core/extensions/app_sizes.dart';
import 'package:osta/core/localization/app_localizations.dart';
import 'package:osta/presentation/components/app_button.dart';
import 'package:osta/presentation/components/app_text_field.dart';
import 'package:osta/presentation/components/cleaning_orders_components/custom_checkbox.dart';
import 'package:osta/presentation/components/cleaning_orders_components/custom_radio_button.dart';
import 'package:osta/presentation/components/cleaning_orders_components/custom_range_slider.dart';
import 'package:osta/presentation/components/custom_app_bar.dart';
import 'package:osta/presentation/components/join_application_components/app_drop_down.dart';
import 'package:osta/presentation/components/join_application_components/label_text.dart';
import 'package:osta/presentation/components/more_details_row.dart';
import 'package:osta/presentation/components/order_components/appointment_booking_widget.dart';
import 'package:osta/presentation/components/order_components/service_type_card.dart';
import 'package:osta/presentation/components/upload_multiple_images_widget.dart';
import 'package:osta/presentation/router/routes.dart';

class SterilizationCleaningOrderScreen extends StatelessWidget {
  const SterilizationCleaningOrderScreen({super.key});

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
              ServiceTypeCard(serviceType: 'cleaning.sterilization'.tr(context)),
              SizedBox(height: 32.h,),
              LabelText(labelText: 'cleaning.how_often_do_you_want_to_be_sterilized?'.tr(context),padding: 30,),
              SizedBox(height: 16.h,),
              AppDropDown(items: ['cleaning.for_one_time'.tr(context),
                'cleaning.once_a_week'.tr(context),
                'cleaning.once_every_2_weeks'.tr(context),
               ],),
              SizedBox(height: 32.h,),
              LabelText(labelText: 'order_details.address_type'.tr(context),padding: 30,),
              SizedBox(height: 16.h,),
              AppDropDown(items: [
                'order_details.office'.tr(context),
                'order_details.house'.tr(context),
                'order_details.school'.tr(context),
                'order_details.bank'.tr(context),
                'order_details.mosque'.tr(context),
                'order_details.church'.tr(context),
                'order_details.shop'.tr(context),
                'order_details.building'.tr(context),
              ],),
              SizedBox(height: 32.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(child: CustomRadioButton(radioTitle: 'cleaning.in_door'.tr(context), radioVal: 'both', groupVal: 'both',padding: 2,)),
                  Expanded(child: CustomRadioButton(radioTitle: 'cleaning.out_door'.tr(context), radioVal: 'both', groupVal: 'both',padding: 2,)),
                  Expanded(child: CustomRadioButton(radioTitle: 'common.both'.tr(context), radioVal: 'both', groupVal: 'both',padding: 2,)),
                ],
              ),
              SizedBox(height: 32.h,),
            LabelText(labelText: 'cleaning.Sterilization_type'.tr(context),padding: 30,),
              SizedBox(height: 16.h,),
              CustomCheckBox(checkboxTitle: 'cleaning.general_sterilization'.tr(context)),
              CustomCheckBox(checkboxTitle: 'cleaning.sterilization_against_corona'.tr(context)),
              CustomCheckBox(checkboxTitle: 'cleaning.steam_sterilization'.tr(context)),
              CustomCheckBox(checkboxTitle: 'cleaning.sterilization_of_devices_and_equipment'.tr(context)),
              CustomCheckBox(checkboxTitle: 'cleaning.sterilization_against_insects_and_rodents'.tr(context)),
              CustomCheckBox(checkboxTitle: 'cleaning.installation_of_water_filters'.tr(context)),
              CustomCheckBox(checkboxTitle: 'cleaning.sterilization_with_chlorine'.tr(context)),
              SizedBox(height: 32.h,),
              LabelText(labelText: 'cleaning.the_space_to_be_sterilized?'.tr(context),padding: 30,),
              SizedBox(height: 16.h,),
              CustomSlider(),
              SizedBox(height: 32.h,),
              LabelText(labelText: 'cleaning.do_you_want_to_set_traps_for_mice_and_snakes?'.tr(context),padding: 30,),
              SizedBox(height: 16.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(child: CustomRadioButton(radioTitle: 'common.yes'.tr(context), radioVal: 'yes', groupVal: 'yes',padding: 2,)),
                  Expanded(child: CustomRadioButton(radioTitle: 'common.no'.tr(context), radioVal: 'yes', groupVal: 'yes',padding: 2,)),
              ],
              ),
              SizedBox(height: 32.h,),
MoreDetailsRow(),
              SizedBox(height: 16.h,),
              AppTextField(maxLines: 5,height: 102.h,),
              SizedBox(height: 24.h,),
              Divider(
                thickness: 2,
              ),
              SizedBox(height: 24.h,),
              MoreDetailsRow(isAddPictures: true,),
              SizedBox(height: 16.h,),
              UploadMultipleImagesWidget(),
              Divider(
                thickness: 2,
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
                height: 79.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
