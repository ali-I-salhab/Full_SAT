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

class StreetCleaningOrderScreen extends StatelessWidget {
  const StreetCleaningOrderScreen({super.key});

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
               ServiceTypeCard(serviceType: 'cleaning.street_cleaning'.tr(context)),
              SizedBox(height: 32.h,),             Row(
mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: [
                 Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     LabelText(labelText: 'cleaning.length'.tr(context),),
                     SizedBox(height: 16.h,),
                     AppTextField( inputType: TextInputType.number,width: 174.w,height: 50.h,),
                   ],
                 ),
                 SizedBox(width: 16.w,),
                 Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     LabelText(labelText: 'cleaning.width'.tr(context),padding: 20,),
                     SizedBox(height: 16.h,),
                     AppTextField( inputType: TextInputType.number,width: 174.w,height: 50.h,),
                   ],
                 ),
               ],
             ),
              SizedBox(height: 32.h,),

              LabelText(labelText: 'cleaning.is_there'.tr(context),padding: 30,),
              SizedBox(height: 16.h,),
              CustomCheckBox(checkboxTitle: 'cleaning.clay'.tr(context)),
              CustomCheckBox(checkboxTitle: 'cleaning.rubble'.tr(context)),
              CustomCheckBox(checkboxTitle: 'cleaning.holes'.tr(context)),
              CustomCheckBox(checkboxTitle: 'cleaning.blockages'.tr(context)),
              CustomCheckBox(checkboxTitle: 'common.other'),
              SizedBox(height: 32.h,),

                 LabelText(labelText: 'cleaning.what_equipment_is_required_for_work:'.tr(context),padding: 30,),
              SizedBox(height: 16.h,),
              CustomCheckBox(checkboxTitle: 'cleaning.bobcat_machine'.tr(context)),
              CustomCheckBox(checkboxTitle: 'cleaning.sprinklers'.tr(context)),
              CustomCheckBox(checkboxTitle: 'cleaning.mushaf'.tr(context)),
              CustomCheckBox(checkboxTitle: 'common.other'),
              SizedBox(height: 32.h,),

              QuestionWithExplaination(questionText: 'cleaning.would_you_like_to_receive_a_cost_estimate_before_starting_your_service'.tr(context)) ,
              SizedBox(height: 16.h,),
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
              SizedBox(height: 86.h,),

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
