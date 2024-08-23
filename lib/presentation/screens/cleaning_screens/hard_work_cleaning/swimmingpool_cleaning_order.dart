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
import 'package:osta/presentation/components/cleaning_orders_components/question_with_explaination.dart';
import 'package:osta/presentation/components/custom_app_bar.dart';
import 'package:osta/presentation/components/join_application_components/app_drop_down.dart';
import 'package:osta/presentation/components/join_application_components/label_text.dart';
import 'package:osta/presentation/components/more_details_row.dart';
import 'package:osta/presentation/components/order_components/appointment_booking_widget.dart';
import 'package:osta/presentation/components/order_components/service_type_card.dart';
import 'package:osta/presentation/components/upload_multiple_images_widget.dart';
import 'package:osta/presentation/router/routes.dart';

class SwimmingPoolCleaningOrderScreen extends StatelessWidget {
  const SwimmingPoolCleaningOrderScreen({super.key});

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
               ServiceTypeCard(serviceType: 'cleaning.swimming_pool_cleaning'.tr(context)),
              SizedBox(height: 32.h,),
              LabelText(labelText: 'cleaning.what_does_the_pool_contain'.tr(context),padding: 30,),
              SizedBox(height: 16.h,),
              CustomCheckBox(checkboxTitle: 'cleaning.gym'.tr(context)),
              CustomCheckBox(checkboxTitle: 'cleaning.sauna'.tr(context)),
              CustomCheckBox(checkboxTitle: 'cleaning.baths'.tr(context)),
              CustomCheckBox(checkboxTitle: 'cleaning.toilets'.tr(context)),
              CustomCheckBox(checkboxTitle: 'cleaning.changing_rooms'.tr(context)),
              CustomCheckBox(checkboxTitle: 'cleaning.moroccan_bath'.tr(context)),
              SizedBox(height: 32.h,),

              LabelText(labelText: 'cleaning.what_is_the_area_of_the_swimming_pool_in_square_metres?'.tr(context),padding: 30,),
              SizedBox(height: 16.h,),
              CustomSlider(),
              SizedBox(height: 32.h,),
              LabelText(labelText: 'cleaning.how_many_bathrooms'.tr(context),padding: 30,),
              SizedBox(height: 16.h,),
              AppTextField( inputType: TextInputType.number,),
              SizedBox(height: 32.h,),

              LabelText(labelText: 'cleaning.type_of_pool_surface_material'.tr(context),padding: 30,),
              SizedBox(height: 16.h,),
              CustomRadioButton(radioTitle: 'cleaning.cement'.tr(context), radioVal: 'Underground', groupVal: 'Underground'),
              CustomRadioButton(radioTitle: 'cleaning.ceramic'.tr(context), radioVal: 'Underground', groupVal: 'Underground'),
              CustomRadioButton(radioTitle: 'cleaning.vinyl'.tr(context), radioVal: 'Underground', groupVal: 'Underground'),
              CustomRadioButton(radioTitle: 'common.other'.tr(context), radioVal: 'Underground', groupVal: 'Underground'),
              SizedBox(height: 32.h,),
              LabelText(labelText: 'cleaning.cleaning_Type:'.tr(context),padding: 30,),
              SizedBox(height: 16.h,),
              CustomRadioButton(radioTitle: 'cleaning.normal_cleaning'.tr(context), radioVal: 'Underground', groupVal: 'Underground'),
              CustomRadioButton(radioTitle: 'cleaning.sterilization'.tr(context), radioVal: 'Underground', groupVal: 'Underground'),
              SizedBox(height: 32.h,),
              LabelText(labelText: 'cleaning.pollution_status'.tr(context),padding: 30,),
              SizedBox(height: 16.h,),
              CustomSlider(),
              SizedBox(height: 32.h,),
             QuestionWithExplaination(questionText: 'cleaning.do_you_have_special_materials_that_you_would_like_the_team_to_use?'.tr(context)) ,
              SizedBox(height: 32.h,),
            MoreDetailsRow(),
              SizedBox(height: 16.h,),
              AppTextField(maxLines: 5,height: 102.h,),
  SizedBox(height: 24.h,),
              Divider(thickness: 2,
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
                height: 53.h
              ),
            ],
          ),
        ),
      ),
    );
  }
}
