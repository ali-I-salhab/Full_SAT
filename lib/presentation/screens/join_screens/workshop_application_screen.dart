import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:osta/core/extensions/app_sizes.dart';
import 'package:osta/core/localization/app_localizations.dart';
import 'package:osta/presentation/components/app_button.dart';
import 'package:osta/presentation/components/app_text_field.dart';
import 'package:osta/presentation/components/custom_app_bar.dart';
import 'package:osta/presentation/components/join_application_components/app_drop_down.dart';
import 'package:osta/presentation/components/join_application_components/label_text.dart';
import 'package:osta/presentation/components/join_application_components/multiple_number_input.dart';
import 'package:osta/presentation/components/join_application_components/submit_title_row.dart';
import 'package:osta/presentation/components/join_application_components/upload_image_widget.dart';

class WorkshopApplicationScreen extends StatelessWidget {
  const WorkshopApplicationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(          title: 'common.join_us'.tr(context),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 32.h,),
              SubmitTitleRow(joinSvg: 'assets/images/joinus_assets/workshop.svg'),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.0.w),
                child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 32.h,),

                AppTextField(labelText: 'join_us.contractor_name'.tr(context),),
                  SizedBox(height: 32.h,),
                MultipleNumberInput(),
                  SizedBox(height: 32.h,),
                AppTextField(labelText: 'common.nationality'.tr(context),),
                  SizedBox(height: 32.h,),
                  LabelText(labelText: 'join_us.specialist'.tr(context)),
                  SizedBox(height: 16.h,),
                AppDropDown(items: ['common.yes'.tr(context), 'common.no'.tr(context)],),
                  SizedBox(height: 16.h,),
                  AppTextField(labelText: 'common.other'.tr(context),),
                  SizedBox(height: 32.h,),
                  AppTextField(labelText: 'join_us.number_of_workers'.tr(context),),
                  SizedBox(height: 32.h,),
                LabelText(labelText: 'join_us.available'.tr(context)),
                  SizedBox(height: 16.h,),
                AppDropDown(items: ['join_us.daily_8_hours'.tr(context), 'join_us.hourly'.tr(context),'common.both'.tr(context)]),
                  SizedBox(height: 16.h,),
                  LabelText(labelText: 'join_us.workplaces'.tr(context)),
                  SizedBox(height: 16.h,),
                AppDropDown(items: ['Erbil', 'Duhok','Baghdad']),
                  SizedBox(height: 32.h,),
                AppTextField(labelText: 'join_us.number_of_vehicles'.tr(context),),
                  SizedBox(height: 32.h,),
                  LabelText(labelText: 'join_us.there_is_a_uniform_suit?'.tr(context)),
                  SizedBox(height: 16.h,),
                  AppDropDown(items: ['common.yes'.tr(context), 'common.no'.tr(context)],),
                  SizedBox(height: 32.h,),
                  LabelText(labelText: 'join_us.upload_pictures_of_your_work?'.tr(context)),
                  SizedBox(height: 16.h,),
                UploadWidget(isCircleWidget: false),
                SizedBox(height: 103.h,),
                AppButton(onTap: (){}, buttonText: 'common.save'.tr(context)),
                  SizedBox(height: 26.h,),


                ],
                ),
              ),
            ],
          ),
      ),
      ),
    );
  }
}
