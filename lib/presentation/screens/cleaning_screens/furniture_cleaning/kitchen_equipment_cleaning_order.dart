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
import 'package:osta/presentation/components/cleaning_orders_components/question_column.dart';
import 'package:osta/presentation/components/cleaning_orders_components/question_with_explaination.dart';
import 'package:osta/presentation/components/custom_app_bar.dart';
import 'package:osta/presentation/components/join_application_components/app_drop_down.dart';
import 'package:osta/presentation/components/join_application_components/label_text.dart';
import 'package:osta/presentation/components/more_details_row.dart';
import 'package:osta/presentation/components/order_components/appointment_booking_widget.dart';
import 'package:osta/presentation/components/order_components/service_type_card.dart';
import 'package:osta/presentation/components/upload_multiple_images_widget.dart';
import 'package:osta/presentation/router/routes.dart';

class KitchenEquipmentCleaningOrderScreen extends StatelessWidget {
  const KitchenEquipmentCleaningOrderScreen({super.key});

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
               ServiceTypeCard(serviceType: 'cleaning.kitchen_equipment_cleaning'.tr(context)),
              SizedBox(height: 32.h,),
              LabelText(labelText: 'cleaning.equipments_that_needs_special_handing?'.tr(context),padding: 30,),
              SizedBox(height: 16.h,),
              CustomCheckBox(checkboxTitle: 'cleaning.electrics'.tr(context)),
              CustomCheckBox(checkboxTitle: 'cleaning.the_oven'.tr(context)),
              CustomCheckBox(checkboxTitle: 'cleaning.pride'.tr(context)),
              CustomCheckBox(checkboxTitle: 'cleaning.aluminum_surfaces'.tr(context)),
              CustomCheckBox(checkboxTitle: 'cleaning.wooden_surface'.tr(context)),
              SizedBox(height: 32.h,),

              LabelText(labelText: 'cleaning.total_quantity_of_equipments?'.tr(context),padding: 30,),
              SizedBox(height: 16.h,),
              AppTextField( inputType: TextInputType.number,),
              SizedBox(height: 32.h,),
QuestionColumn(questionText: 'cleaning.do_you_provide_supervisor?'.tr(context)),
              SizedBox(height: 32.h,),

              LabelText(labelText: 'cleaning.what_type_of_equipment_needs_to_be_cleaned?'.tr(context),padding: 30,),
              SizedBox(height: 16.h,),
              AppDropDown(items: ['cleaning.electrical'.tr(context),
                'cleaning.beds'.tr(context),
                'cleaning.metal_equipment'.tr(context),
                'cleaning.screen'.tr(context),
                ],width: context.width*0.9),
              SizedBox(height: 32.h,),
              LabelText(labelText: 'cleaning.equipment_soiling_rate?'.tr(context),padding: 30,),
              SizedBox(height: 16.h,),
              CustomSlider(),
              SizedBox(height: 32.h,),
              LabelText(labelText: 'cleaning.cleaning_type?'.tr(context),padding: 30,),
              SizedBox(height: 16.h,),
              CustomCheckBox(checkboxTitle: 'cleaning.normal_cleaning'.tr(context)),
              CustomCheckBox(checkboxTitle: 'cleaning.fat_removal'.tr(context)),
              CustomCheckBox(checkboxTitle: 'cleaning.traces_of_burning'.tr(context)),
              CustomCheckBox(checkboxTitle: 'cleaning.deep_sterilization'.tr(context)),
              CustomCheckBox(checkboxTitle: 'cleaning.steam_cleaning'.tr(context)),
              SizedBox(height: 32.h,),
              QuestionWithExplaination(questionText: 'cleaning.do_you_have_designated_sterilization_materials_that_you_would_like_the_team_to_use?'.tr(context) ),
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
              SizedBox(height:53.h
              ),
            ],
          ),
        ),
      ),
    );
  }
}
