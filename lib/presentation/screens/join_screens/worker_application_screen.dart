import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:osta/core/appkeys/app_keys.dart';
import 'package:osta/core/appkeys/join_us_keys.dart';
import 'package:osta/core/extensions/app_sizes.dart';
import 'package:osta/core/localization/app_localizations.dart';
import 'package:osta/core/utils/osta_custom_icons_icons.dart';
import 'package:osta/core/utils/text_field_currency_formatters.dart';
import 'package:osta/logic/join_us/join_us_cubit/join_us_cubit.dart';
import 'package:osta/logic/join_us/join_us_cubit/join_us_state.dart';
import 'package:osta/logic/join_us/worker_application_cubit/worker_application_cubit.dart';
import 'package:osta/logic/join_us/worker_application_cubit/worker_application_state.dart';
import 'package:osta/presentation/components/app_button.dart';
import 'package:osta/presentation/components/app_text_field.dart';
import 'package:osta/presentation/components/custom_app_bar.dart';
import 'package:osta/presentation/components/join_application_components/app_drop_down.dart';
import 'package:osta/presentation/components/join_application_components/label_text.dart';
import 'package:osta/presentation/components/join_application_components/multiple_language_input.dart';
import 'package:osta/presentation/components/join_application_components/multiple_number_input.dart';
import 'package:osta/presentation/components/join_application_components/submit_title_row.dart';
import 'package:osta/presentation/components/join_application_components/upload_image_widget.dart';

class WorkerApllicationScreen extends StatelessWidget {
  const WorkerApllicationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'common.join_us'.tr(context),
        ),
        body: BlocConsumer<JoinUsCubit, JoinUsState>(
  listener: (context, state) {
      // TODO: implement listener
  },
  builder: (context, state) {
      JoinUsCubit joinUsCubit = JoinUsCubit.get(context);
      WorkerApplicationCubit workerApplicationCubit = WorkerApplicationCubit.get(context);
      return SingleChildScrollView(
          // padding: EdgeInsets.symmetric(horizontal: 32.h),
          child: Form(
            key: JoinUsKeys.workerFormKey,
            child: Column(
              children: [
                SizedBox(height: 32.h,),
                SubmitTitleRow(joinSvg:'assets/images/joinus_assets/worker.svg'),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.0.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 32.h,),
                      LabelText(labelText: 'join_us.who_do_you_want_to_contract_with'.tr(context)),
                      SizedBox(height: 16.h,),
                      StatefulBuilder(
                        builder: (context,setState) {
                          return AppDropDown(
                            isRequired: true,
                              value: workerApplicationCubit.workerContractCompany,
                              onChanged: (value){
                                setState((){
                                  workerApplicationCubit.workerContractCompany = value ;
                                });
                              },
                              items: ['any companies', 'common.app_name'.tr(context), 'common.both'.tr(context)]);
                        }
                      ),
                      SizedBox(height: 32.h,),
                      LabelText(labelText: 'join_us.what_is_your_job?'.tr(context)),
                      SizedBox(height: 16.h,),
                      StatefulBuilder(
                        builder: (context,setState) {
                          return AppDropDown(
                            isRequired: true,
                              value: workerApplicationCubit.workerJob,
                              onChanged: (val) {
                              print(val);
                               setState((){
                                 workerApplicationCubit.workerJob = val;
                               });
                              },
                              items: ['common.worker'.tr(context), 'join_us.engineer'.tr(context)],
                          // onChanged: (val) => context.read<JoinUsCubit>().changeSelectedJob(val as String)
                          );
                        }
                      ),
                      SizedBox(height: 32.h,),
                      LabelText(labelText: 'join_us.upload_your_image'.tr(context)),
                      SizedBox(height: 16.h,),
                      StatefulBuilder(
                        builder: (context,setState) {
                          return UploadWidget(isCircleWidget: true,
                          pickedmage: workerApplicationCubit.workerImage,
                          onTap: () async{
                            await joinUsCubit.pickImage().then((value) {
                              setState(() {
                                workerApplicationCubit.workerImage = value;
                              });
                            });
                          },
                          );
                        }
                      ),
                      SizedBox(height: 32.h,),
                      AppTextField(labelText: 'common.full_name'.tr(context),
                      inputType: TextInputType.name,
                        controller: workerApplicationCubit.workerfullName,
                        validator: (val){
                        if(val == null || val == ''){
                          return ' please enter your name';
                        }
                        return null;
                        },
                      ),
                      SizedBox(height: 16.h,),
                      AppTextField(
                        controller: workerApplicationCubit.workerAge,
                        inputType: TextInputType.number,
                        validator: (value){
                          if(value != null || value != '' ) {
                            final ageVale = int.tryParse(value!);
                            if (ageVale! <= 18 || ageVale >= 50)
                              return 'Age not allowed';
                          }
                          return null;
                              },
                        labelText: 'common.age'.tr(context),),
                      SizedBox(height: 16.h,),
                      AppTextField(labelText: 'common.location'.tr(context),),
                      SizedBox(height: 16.h,),
                      MultipleNumberInput(),
                      SizedBox(height: 16.h,),
                      AppTextField(labelText: 'common.nationality'.tr(context),
                      inputType: TextInputType.text,
                      ),
                      SizedBox(height: 16.h,),
                      MultipleLanguageInput(),

                      workerApplicationCubit.workerJob == 'engineer' ? Column(
                        children: [
                          SizedBox(height: 32.h,),
                          LabelText(labelText: 'worker.education'.tr(context)),
                          SizedBox(height: 16.h,),
                          StatefulBuilder(
                            builder: (context,setState) {
                              return AppDropDown(
                                  value: workerApplicationCubit.workerEducation,
                                  onChanged: (value){
                                    setState((){
                                      workerApplicationCubit.workerEducation = value ;
                                    });
                                  },
                                  items: ['join_us.associates_degree'.tr(context), 'join_us.bachelor_degree'.tr(context),
                                'join_us.master_degree'.tr(context),
                                'join_us.doctorate_degree'.tr(context)]);
                            }
                          ),
                          SizedBox(height: 32.h,),
                          LabelText(labelText: 'join_us.upload_cv'.tr(context)),
                          SizedBox(height: 16.h,),
                          UploadWidget(isCircleWidget: false),
                        ],
                      ) : SizedBox(),
                      SizedBox(height: 32.h,),
                      LabelText(labelText: 'join_us.do_you_have_a_driving_license?'.tr(context)),
                      SizedBox(height: 16.h,),
                      StatefulBuilder(
                        builder: (context,setState) {
                          return AppDropDown(
                              isRequired: true,
                              value: workerApplicationCubit.workerDriverLic,
                              onChanged: (val){
                                setState((){
                                  workerApplicationCubit.workerDriverLic = val;
                                });
                              },
                              items: ['common.yes'.tr(context), 'common.no'.tr(context)]);
                        }
                      ),
                      SizedBox(height: 32.h,),
                      LabelText(labelText: 'join_us.do_you_have_vehicles?'.tr(context)),
                      SizedBox(height: 16.h,),
                      StatefulBuilder(
                          builder: (context,setState) {
                            return AppDropDown(
                              isRequired: true,
                              value: workerApplicationCubit.workerVehicle,
                              onChanged: (val){
                                setState((){
                                  workerApplicationCubit.workerVehicle = val;
                                });
                              },
                              items: ['join_us.car'.tr(context), 'join_us.motorcycle'.tr(context),'join_us.bicycle'.tr(context),'join_us.i_dont_have'.tr(context)]);
                        }
                      ),
                      SizedBox(height: 32.h,),
                      AppDropDown(items: ['join_us.hourly'.tr(context), 'join_us.weekly'.tr(context),'join_us.daily'.tr(context),'join_us.monthly'.tr(context)],hintText: 'common.salary'.tr(context)),
                      SizedBox(height: 16.h,),
                      AppTextField(
                        inputType: TextInputType.number,
                        controller: workerApplicationCubit.expecedSalary,
                        inputFormatters: [CurrencyInputFormatter()],
                        labelText: 'join_us.expected_salary'.tr(context),),

                      SizedBox(height: 72.h,),
                      AppButton(onTap: (){
    if (JoinUsKeys.workerFormKey.currentState!.validate()) {
print(workerApplicationCubit.workerImage);
    }

    }, buttonText: 'common.save'.tr(context)),
                      SizedBox(height: 29.h,),

                    ],
                  ),
                ),
              ],
            ),
          ),
        );
  },
),
      ),
    );
  }
}
