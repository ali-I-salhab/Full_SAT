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
import 'package:osta/presentation/components/custom_app_bar.dart';
import 'package:osta/presentation/components/join_application_components/app_drop_down.dart';
import 'package:osta/presentation/components/join_application_components/label_text.dart';
import 'package:osta/presentation/components/long_centered_text.dart';
import 'package:osta/presentation/components/more_details_row.dart';
import 'package:osta/presentation/components/order_components/appointment_booking_widget.dart';
import 'package:osta/presentation/components/order_components/service_type_card.dart';
import 'package:osta/presentation/components/upload_multiple_images_widget.dart';
import 'package:osta/presentation/router/routes.dart';

class FrontageCleaningOrderScreen extends StatelessWidget {
  const FrontageCleaningOrderScreen({super.key});

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
               ServiceTypeCard(serviceType: 'cleaning.frontage_cleaning'.tr(context)),
              SizedBox(height: 32.h,),
              LabelText(labelText: 'cleaning.frontage_material'.tr(context),padding: 30,),
              SizedBox(height: 16.h,),
              AppDropDown(items: ['cleaning.external_glass'.tr(context),
                'cleaning.metal_facade'.tr(context),
                'cleaning.wooden_facade'.tr(context),
                'cleaning.stone_facade'.tr(context),
                'common.other'.tr(context),
               ],width: context.width*0.9),
              SizedBox(height: 32.h,),

              LabelText(labelText: 'cleaning.how_many_floors?'.tr(context),padding: 30,),
              SizedBox(height: 16.h,),
              AppTextField( inputType: TextInputType.number,),
              SizedBox(height: 32.h,),
              LabelText(labelText: 'cleaning.do_you_prefer_they_use'.tr(context),padding: 30,),
              SizedBox(height: 16.h,),
              CustomRadioButton(radioTitle: 'cleaning.rope_cranes'.tr(context), radioVal: 'other', groupVal: 'clean type'),
              CustomRadioButton(radioTitle: 'cleaning.tor_cranes'.tr(context), radioVal: 'other', groupVal: 'clean type'),
              SizedBox(height: 32.h,),
              LabelText(labelText: 'cleaning.what_area_of_glass_do_you_want_to_clean?'.tr(context),padding: 30,),
              SizedBox(height: 16.h,),
              AppTextField( maxLines: 5,height: 102.h,),
              SizedBox(height: 32.h,),
              LabelText(labelText: 'cleaning.frontage_condition?'.tr(context),padding: 30,),
              SizedBox(height: 16.h,),
              CustomSlider(),
              SizedBox(height: 32.h,),
              LabelText(labelText: 'cleaning.is_there_any_additional_information_about_access_to_the_glass,_such_as_the_high_height_or_difficulty_of_reaching_the_glass_to_some_windows?'.tr(context),padding: 30,),
              SizedBox(height: 16.h,),
           AppTextField( maxLines: 5,height: 102.h,),
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
