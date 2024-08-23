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
import 'package:osta/presentation/components/more_details_row.dart';
import 'package:osta/presentation/components/order_components/appointment_booking_widget.dart';
import 'package:osta/presentation/components/order_components/service_type_card.dart';
import 'package:osta/presentation/components/upload_multiple_images_widget.dart';
import 'package:osta/presentation/router/routes.dart';

class HouseCleaningOrderScreen extends StatelessWidget {
  const HouseCleaningOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(title: 'common.order_details'.tr(context)),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 32.w),
          child: Column(
            children: [
              SizedBox(
                height: 16.h,
              ),
              ServiceTypeCard(
                  serviceType: 'cleaning.house_cleaning'.tr(context)),
              SizedBox(
                height: 32.h,
              ),
              LabelText(
                labelText: 'order_details.address_type'.tr(context),
                padding: 30,
              ),
              SizedBox(
                height: 16.h,
              ),
              AppDropDown(items: [
                'order_details.hotel'.tr(context),
                'order_details.house'.tr(context),
                'order_details.restaurant'.tr(context),
                'order_details.lab'.tr(context),
                'order_details.company'.tr(context),
                'order_details.store'.tr(context)
              ], width: context.width * 0.9),
              SizedBox(
                height: 32.h,
              ),
              Row(
                children: [
                  Expanded(
                      child: CustomRadioButton(
                          radioTitle: 'cleaning.unfurnitured'.tr(context),
                          radioVal: 'unfurnitured',
                          groupVal: 'furnitured')),
                  Expanded(
                      child: CustomRadioButton(
                          radioTitle: 'cleaning.furnitured'.tr(context),
                          radioVal: 'furnitured',
                          groupVal: 'furnitured')),
                ],
              ),
              SizedBox(
                height: 24.h,
              ),
              Row(
                children: [
                  Expanded(
                      child: CustomRadioButton(
                          radioTitle: 'cleaning.regular_leaning'.tr(context),
                          radioVal: 'regular',
                          groupVal: 'type')),
                  Expanded(
                      child: CustomRadioButton(
                          radioTitle: 'cleaning.deep_cleaning'.tr(context),
                          radioVal: 'deep',
                          groupVal: 'type')),
                ],
              ),
              SizedBox(
                height: 32.h,
              ),
              LabelText(
                labelText: 'cleaning.how_many_rooms'.tr(context),
                padding: 30,
              ),
              SizedBox(
                height: 16.h,
              ),
              AppTextField(
                inputType: TextInputType.number,
              ),
              SizedBox(
                height: 32.h,
              ),
              LabelText(
                labelText: 'cleaning.how_many_bathrooms'.tr(context),
                padding: 30,
              ),
              SizedBox(
                height: 16.h,
              ),
              AppTextField(
                inputType: TextInputType.number,
              ),
              SizedBox(
                height: 32.h,
              ),
              LabelText(
                labelText:
                    'cleaning.what_is_the_area_of_the_house_in_square_metres'
                        .tr(context),
                padding: 30,
              ),
              SizedBox(
                height: 16.h,
              ),
              CustomSlider(),
              MoreDetailsRow(),
              SizedBox(
                height: 16.h,
              ),
              AppTextField(
                maxLines: 5,
                height: 102.h,
              ),
              SizedBox(
                height: 24.h,
              ),
              Divider(
                thickness: 2,
              ),
              SizedBox(
                height: 24.h,
              ),
              MoreDetailsRow(
                isAddPictures: true,
              ),
              SizedBox(
                height: 16.h,
              ),
              UploadMultipleImagesWidget(),
              SizedBox(
                height: 24.h,
              ),
              Divider(
                thickness: 2,
              ),
              SizedBox(
                height: 24.h,
              ),
              AppointmentBookingWidget(),
              SizedBox(height: 86.h),
              AppButton(
                  onTap: () {
                    context.navigateTo(
                        routeName: Routes.orderCostDetailsViewRoute);
                  },
                  buttonText: 'common.next'.tr(context)),
              SizedBox(height: 53.h),
            ],
          ),
        ),
      ),
    );
  }
}
