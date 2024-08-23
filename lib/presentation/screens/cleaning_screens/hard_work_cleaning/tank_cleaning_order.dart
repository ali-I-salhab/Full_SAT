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

class TankCleaningOrderScreen extends StatelessWidget {
  const TankCleaningOrderScreen({super.key});

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
               ServiceTypeCard(serviceType: 'cleaning.tank_cleaning'.tr(context)),
              SizedBox(height: 32.h,),

              LabelText(labelText: 'cleaning.how_many_tanks?'.tr(context),padding: 30,),
              SizedBox(height: 16.h,),
              AppTextField( inputType: TextInputType.number,),
              SizedBox(height: 32.h,),

              LabelText(labelText: 'cleaning.what_are_the_capacity_of_your_tanks?'.tr(context),padding: 30,),
              SizedBox(height: 16.h,),
              AppTextField( maxLines: 5,),

              SizedBox(height: 32.h,),

              LabelText(labelText: 'cleaning.type_of_tanks:'.tr(context),padding: 30,),
              SizedBox(height: 16.h,),
              CustomCheckBox(checkboxTitle: 'cleaning.stainless_steel_tanks'.tr(context)),
              CustomCheckBox(checkboxTitle: 'cleaning.galvanized_sheet_tanks'.tr(context)),
              CustomCheckBox(checkboxTitle: 'cleaning.fiberglass_tanks'.tr(context)),
              CustomCheckBox(checkboxTitle: 'cleaning.polyethylene_tanks'.tr(context)),
              CustomCheckBox(checkboxTitle: 'common.other'),
              SizedBox(height: 32.h,),

              LabelText(labelText: 'cleaning.location_of_tanks'.tr(context),padding: 30,),
              SizedBox(height: 16.h,),
CustomRadioButton(radioTitle: 'cleaning.above_the_ground'.tr(context), radioVal: 'Underground', groupVal: 'Underground'),
CustomRadioButton(radioTitle: 'cleaning.on_top_of_the_building'.tr(context), radioVal: 'Underground', groupVal: 'Underground'),
CustomRadioButton(radioTitle: 'cleaning.underground'.tr(context), radioVal: 'Underground', groupVal: 'Underground'),
              SizedBox(height: 32.h,),

              LabelText(labelText: 'cleaning.tanks_content'.tr(context),padding: 30,),
              SizedBox(height: 16.h,),
              CustomCheckBox(checkboxTitle: 'cleaning.human_waste'.tr(context)),
              CustomCheckBox(checkboxTitle: 'cleaning.factory_waste'.tr(context)),
              CustomCheckBox(checkboxTitle: 'cleaning.chemical_liquids'.tr(context)),
              CustomCheckBox(checkboxTitle: 'cleaning.oil'.tr(context)),
              CustomCheckBox(checkboxTitle: 'cleaning.acids'.tr(context)),
              CustomCheckBox(checkboxTitle: 'cleaning.gas'.tr(context)),
              CustomCheckBox(checkboxTitle: 'cleaning.diesel'.tr(context)),
              CustomCheckBox(checkboxTitle: 'common.other'.tr(context)),
              SizedBox(height: 32.h,),

              LabelText(labelText: 'cleaning.pollution_status'.tr(context),padding: 30,),
              SizedBox(height: 16.h,),
              CustomSlider(),
              SizedBox(height: 32.h,),
              LabelText(labelText: 'cleaning.what_is_the_extent_of_pollution?'.tr(context),padding: 30,),
              SizedBox(height: 16.h,),
              CustomSlider(),
              SizedBox(height: 32.h,),
              LabelText(labelText: 'cleaning.do_you_like_the_tank_to_be_dry?'.tr(context),padding: 30,),
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
              SizedBox(height: 24.h,),
              Divider(
                thickness: 2,
              ),
              SizedBox(height: 24.h,),
              AppointmentBookingWidget(),
              SizedBox(
                height: 86.h,
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
