import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:osta/core/extensions/app_navigator.dart';
import 'package:osta/core/extensions/app_sizes.dart';
import 'package:osta/core/localization/app_localizations.dart';
import 'package:osta/core/utils/osta_custom_icons_icons.dart';
import 'package:osta/logic/join_us/join_us_cubit/join_us_cubit.dart';
import 'package:osta/logic/join_us/join_us_cubit/join_us_state.dart';
import 'package:osta/presentation/components/app_button.dart';
import 'package:osta/presentation/components/app_text_field.dart';
import 'package:osta/presentation/components/custom_app_bar.dart';
import 'package:osta/presentation/components/join_application_components/app_drop_down.dart';
import 'package:osta/presentation/components/join_application_components/label_text.dart';
import 'package:osta/presentation/components/join_application_components/multiple_number_input.dart';
import 'package:osta/presentation/components/join_application_components/submit_title_row.dart';
import 'package:osta/presentation/components/join_application_components/upload_image_widget.dart';
import 'package:osta/presentation/router/app_router.dart';
import 'package:osta/presentation/router/routes.dart';

class StoreApplicationScreen extends StatelessWidget {
  const StoreApplicationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(title: 'join us',),
        body: BlocConsumer<JoinUsCubit, JoinUsState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            JoinUsCubit joinUsCubit = JoinUsCubit.get(context);
            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 32.h,),
                  SubmitTitleRow(joinSvg: 'assets/images/joinus_assets/store.svg',),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32.0.w),
                     child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 32.h,),
                        LabelText(labelText: 'join_us.upload_your_logo'.tr(context)),
                        SizedBox(height: 16.h,),
                        UploadWidget(isCircleWidget: true),
                        SizedBox(height: 32.h,),
                        AppTextField(labelText: 'join_us.name'.tr(context),),
                        SizedBox(height: 32.h,),
                        LabelText(labelText: 'join_us.specialist'.tr(context)),
                        SizedBox(height: 16.h,),
                        AppDropDown(items: ['join_us.any_company'.tr(context), 'common.app_name'.tr(context), 'common.both'.tr(context)]),
                        SizedBox(height: 32.h,),
                        AppTextField(labelText: 'common.location'.tr(context),),
                        SizedBox(height: 32.h,),
                        MultipleNumberInput(),
                        SizedBox(height: 32.h,),
                        LabelText(labelText: 'join_us.available'.tr(context)),
                        SizedBox(height: 16.h,),
                        AppDropDown(items: ['join_us.daily_8_hours'.tr(context), 'join_us.daily'.tr(context),'common.both'.tr(context)]),
                        SizedBox(height: 32.h,),
                        LabelText(labelText: 'join_us.upload_the_contents_of_your_warehouse_as_an_Excel_file_or_pdf'.tr(context)),
                        SizedBox(height: 16.h,),
                        UploadWidget(isCircleWidget: false),
                        SizedBox(height: 22.h,),
                        AppButton(onTap: (){}, buttonText: 'join_us.manual_entry'.tr(context),color: Colors.black12),
                        SizedBox(height: 128.h,),
                        AppButton(onTap: (){
                          // context.navigateTo(routeName: Routes.)
                        }, buttonText:'common.save'.tr(context)),
                        SizedBox(height: 26.h,),

                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
