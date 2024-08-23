import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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

class TransportApplicationScreen extends StatelessWidget {
  const TransportApplicationScreen({super.key});

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
                      SubmitTitleRow(joinSvg: 'assets/images/joinus_assets/transport.svg'),

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 32.0.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          SizedBox(height: 32.h,),
                            AppTextField(labelText: 'common.full_name'.tr(context),),
                            SizedBox(height: 32.h,),
                            AppTextField(labelText: 'common.age'.tr(context),),
                            SizedBox(height: 32.h,),
                            AppTextField(labelText: 'common.location'.tr(context),),
                            SizedBox(height: 32.h,),
                            MultipleNumberInput(),
                            SizedBox(height: 32.h,),
                            AppTextField(labelText: 'common.nationality'.tr(context),),
                            SizedBox(height: 32.h,),
                            LabelText(labelText: 'transport.work_type'.tr(context)),
                            SizedBox(height: 16.h,),
                            AppDropDown(items: [
                              'transport.transfer_only'.tr(context),
                              'transport.disassembly_installation_and_transfer'.tr(context),
                              'transport.transfer_and_save'.tr(context)
                            ]),
                            SizedBox(height: 32.h,),
                            LabelText(labelText: 'join_us.available'.tr(context)),
                            SizedBox(height: 16.h,),
                            AppDropDown(items: ['join_us.daily_8_hours'.tr(context), 'join_us.hourly'.tr(context), 'common.both'.tr(context)]),
                            SizedBox(height: 32.h,),
                            LabelText(labelText: 'join_us.add_cars'.tr(context)),
                            SizedBox(height: 16.h,),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                              Column(
                                // mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment:CrossAxisAlignment.start,
                                children: [
                                  LabelText(labelText: 'join_us.vehicle_type'.tr(context)),
                                  SizedBox(height: 16.h,),
                                  AppDropDown(items: ['KIA'],width: 153.w),
                                ],
                              ),
                                SizedBox(width: 11.w,),

                              Column(
                                crossAxisAlignment:CrossAxisAlignment.start,
                                children: [
                                  LabelText(labelText: 'join_us.weight'.tr(context)),
                                  SizedBox(height: 16.h,),
                                  AppDropDown(items: [],width: 146.w),
                                ],
                              ),
                                SizedBox(width: 5.w,),
                                Column(
                                  crossAxisAlignment:CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.end,

                                  children: [
                                    SizedBox(height: 16.h,),
                                    IconButton(onPressed: (){}, icon: Icon(Icons.add_circle,size: 28.h,)),
                                  ],
                                )
                            ],),
                            SizedBox(height: 32.h,),

                            LabelText(labelText: 'join_us.number_of_vehicles_for_this_details'.tr(context) + '6'),
                            SizedBox(height: 16.h,),
                            ListView.builder(
                              shrinkWrap: true,
                                itemCount: 6,
                                itemBuilder: (context,index){
                              return Container(
                                color: Colors.white,
                                padding: EdgeInsets.symmetric(horizontal: 4.w),
                                margin: EdgeInsets.symmetric(vertical: 4.h),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(Icons.reorder_outlined),
                                    Text('01'),
                                    Text('KIA'),
                                    Text('100Tons'),
                                    IconButton(onPressed: (){}, icon: Icon(Icons.delete_outline))

                                  ],
                                ),
                              );
                            }),

                            SizedBox(height: 64.h,),
                            AppButton(onTap: () {}, buttonText: 'common.save'.tr(context))
                          ,  SizedBox(height: 26.h,),

                          ],
                        ),
                      ),
                    ],
                  ),
                );
              })
      ),
    );
  }
}
