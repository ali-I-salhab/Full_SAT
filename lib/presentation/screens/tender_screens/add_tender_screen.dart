import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:osta/core/extensions/app_navigator.dart';
import 'package:osta/core/localization/app_localizations.dart';
import 'package:osta/presentation/components/app_button.dart';
import 'package:osta/presentation/components/app_text_field.dart';
import 'package:osta/presentation/components/custom_app_bar.dart';
import 'package:osta/presentation/components/join_application_components/app_drop_down.dart';
import 'package:osta/presentation/components/join_application_components/label_text.dart';
import 'package:osta/presentation/components/more_details_row.dart';
import 'package:osta/presentation/components/order_components/appointment_booking_widget.dart';
import 'package:osta/presentation/components/upload_multiple_images_widget.dart';
import 'package:osta/presentation/router/routes.dart';

class AddTenderScreen extends StatelessWidget {
  const AddTenderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(title: 'tender.add_a_tender'?.tr(context) ?? 'Add a tender'),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 32.w),
          child: Column(
            children: [
              SizedBox(height: 32.h,),
              LabelText(labelText: 'tender.tender_type'?.tr(context)??'Tender type:'),
              SizedBox(height: 16.h,),
              AppDropDown(items: [
                'tender.construction_tender'?.tr(context)??'Construction tender',
                'tender.excavation_tender'?.tr(context)??'Excavation tender',
                'tender.maintenance_tender'?.tr(context) ??' Maintenance tender',
                'tender.cleaning_tender'?.tr(context) ?? 'Cleaning tender',
               ]),
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
              SizedBox(height: 32.h,),
              LabelText(labelText: 'tender.add_your_site'?.tr(context)??'Add your site:'),
              SizedBox(height: 16.h,),
              AppTextField(),
              SizedBox(height: 32.h,),
              LabelText(labelText: 'tender.add_contact_numbers:'?.tr(context)??"Add contact numbers:"),
              SizedBox(height: 16.h,),
              AppTextField(),

              SizedBox(
                height:86.h,
              ),
              AppButton(
                  onTap: () {
                    context.navigateTo(
                        routeName: Routes.orderCostDetailsViewRoute);
                  },
                  buttonText: 'tender.add'?.tr(context) ??'Add'),
              SizedBox(
                height: 53.h,
              ),


            ],
          ),
        ) ,
      ),
    );

  }
}
