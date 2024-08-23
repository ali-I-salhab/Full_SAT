import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:osta/core/constants/app_colors.dart';
import 'package:osta/core/extensions/app_navigator.dart';
import 'package:osta/core/extensions/app_sizes.dart';
import 'package:osta/core/localization/app_localizations.dart';
import 'package:osta/presentation/components/app_button.dart';
import 'package:osta/presentation/components/app_text_field.dart';
import 'package:osta/presentation/components/cleaning_orders_components/custom_radio_button.dart';
import 'package:osta/presentation/components/cleaning_orders_components/custom_range_slider.dart';
import 'package:osta/presentation/components/cleaning_orders_components/question_with_explaination.dart';
import 'package:osta/presentation/components/custom_app_bar.dart';
import 'package:osta/presentation/components/join_application_components/app_drop_down.dart';
import 'package:osta/presentation/components/join_application_components/label_text.dart';
import 'package:osta/presentation/components/more_details_row.dart';
import 'package:osta/presentation/components/order_components/appointment_booking_widget.dart';
import 'package:osta/presentation/components/order_components/service_type_card.dart';
import 'package:osta/presentation/components/upload_multiple_images_widget.dart';
import 'package:osta/presentation/router/routes.dart';

class OfficeEquipmentCleaningOrderScreen extends StatelessWidget {
  const OfficeEquipmentCleaningOrderScreen({super.key});

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
               ServiceTypeCard(serviceType: 'cleaning.office_equipment_cleaning'.tr(context)),
              SizedBox(height: 32.h,),
              LabelText(labelText: 'cleaning.how_big_is_the_office_or_space_you_need_to_clean?'.tr(context),padding: 30,),
              SizedBox(height: 16.h,),
              CustomSlider(),
              SizedBox(height: 32.h,),
              LabelText(labelText: 'cleaning.what_type_of_floor_is_in_the_office'.tr(context),padding: 30,),
              SizedBox(height: 16.h,),
              AppDropDown(items: ['cleaning.carpets'.tr(context), 'cleaning.tiles'.tr(context), 'cleaning.wood'.tr(context)],width: context.width*0.9),
              SizedBox(height: 32.h,),
              QuestionWithExplaination(questionText: 'cleaning.is_there_any_special_furniture_or_decor_that_needs_special_cleaning'.tr(context)),
              SizedBox(height: 32.h,),
              LabelText(labelText: 'cleaning.do_you_need_additional_services?'.tr(context),padding: 30,),
              SizedBox(height: 16.h,),
              CustomRadioButton(radioTitle: 'cleaning.cleaning_curtains'.tr(context), radioVal: 'other', groupVal: 'clean type'),
              CustomRadioButton(radioTitle: 'cleaning.surface_polishing'.tr(context), radioVal: 'other', groupVal: 'clean type'),
              CustomRadioButton(radioTitle: 'cleaning.glass_partitions_and_walls'.tr(context), radioVal: 'other', groupVal: 'clean type'),
              SizedBox(height: 42.h,),

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
                height: 86.h
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
