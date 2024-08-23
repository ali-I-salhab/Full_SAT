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
import 'package:osta/presentation/components/custom_app_bar.dart';
import 'package:osta/presentation/components/join_application_components/app_drop_down.dart';
import 'package:osta/presentation/components/join_application_components/label_text.dart';
import 'package:osta/presentation/components/more_details_row.dart';
import 'package:osta/presentation/components/order_components/appointment_booking_widget.dart';
import 'package:osta/presentation/components/order_components/service_type_card.dart';
import 'package:osta/presentation/components/upload_multiple_images_widget.dart';
import 'package:osta/presentation/router/routes.dart';

class GardenCleaningOrderScreen extends StatelessWidget {
  const GardenCleaningOrderScreen({super.key});

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
              ServiceTypeCard(serviceType: 'cleaning.gardens_cleaning'.tr(context)),
              SizedBox(height: 32.h,),
              LabelText(labelText: 'cleaning.garden_type'.tr(context),padding: 30,),
              SizedBox(height: 16.h,),
              AppDropDown(items: ['cleaning.home_garden'.tr(context),
                'cleaning.restaurant_garden'.tr(context),
                'cleaning.hospital_garden'.tr(context),
                'cleaning.public_gardens'.tr(context),
                'cleaning.zoo'.tr(context),
               ],width: context.width*0.9),
              SizedBox(height: 32.h,),
              LabelText(labelText: 'cleaning.garden_area'.tr(context),padding: 30,),
              SizedBox(height: 16.h,),
              CustomSlider(),
              SizedBox(height: 32.h,),
              LabelText(labelText: 'cleaning.work_type'.tr(context),padding: 30,),
              SizedBox(height: 16.h,),
              CustomCheckBox(checkboxTitle: 'cleaning.cleaning_flowers_and_bushes'.tr(context)),
              CustomCheckBox(checkboxTitle: 'cleaning.pruning_plants'.tr(context)),
              CustomCheckBox(checkboxTitle: 'cleaning.cleaning_water_bodies'.tr(context)),
              CustomCheckBox(checkboxTitle: 'cleaning.cleaning_outdoor_furniture'.tr(context)),
              CustomCheckBox(checkboxTitle: 'cleaning.irrigation_systems_operated_and_cleaned'.tr(context)),
              CustomCheckBox(checkboxTitle: 'cleaning.cleaning_hallways_and_walkways'.tr(context)),
              CustomCheckBox(checkboxTitle: 'cleaning.cleaning_fountains'.tr(context)),
              SizedBox(height: 32.h,),

QuestionColumn(questionText: 'cleaning.do_you_need_a_service_for_cleaning_paths_and_hard_surfaces_in_the_garden'.tr(context)),
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
                height:53.h
              ),
            ],
          ),
        ),
      ),
    );
  }
}
