import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:osta/core/appkeys/app_keys.dart';
import 'package:osta/core/constants/app_colors.dart';
import 'package:osta/core/extensions/app_navigator.dart';
import 'package:osta/core/helpers/render_widget_helper.dart';
import 'package:osta/core/localization/app_localizations.dart';
import 'package:osta/core/utils/app_text_styles.dart';
import 'package:osta/data/models/field_info.dart';
import 'package:osta/data/models/parameter_models/order_cost_info_parameter.dart';
import 'package:osta/logic/main_cubit/main_cubit.dart';
import 'package:osta/logic/main_cubit/main_state.dart';
import 'package:osta/presentation/components/app_button.dart';
import 'package:osta/presentation/components/app_error_dialog.dart';
import 'package:osta/presentation/components/app_loading_dialog.dart';
import 'package:osta/presentation/components/app_text_field.dart';
import 'package:osta/presentation/components/cleaning_orders_components/custom_checkbox.dart';
import 'package:osta/presentation/components/cleaning_orders_components/custom_radio_button.dart';
import 'package:osta/presentation/components/custom_app_bar.dart';
import 'package:osta/presentation/components/join_application_components/label_text.dart';
import 'package:osta/presentation/components/order_components/service_type_card.dart';
import 'package:osta/presentation/router/routes.dart';

class MainOrderScreen extends StatelessWidget {
  const MainOrderScreen({super.key,required this.serviceFields});
  final ServiceFields serviceFields;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(title: 'common.order_details'.tr(context,)),
        body: BlocConsumer<MainCubit,MainState>(
            listener: (context,state) async{
              if(state is SendDataLoadingState){
                showAdaptiveDialog<Widget>(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) => const LoadingDialog(),
                );
              }
              else if(state is SendDataSuccessState){
                context.getBack();
                context.navigateTo(
                    routeName: Routes
                        .orderCostDetailsViewRoute,arguments:
                OrderCostInfoParam(
                  formId: serviceFields.catMainInfo.catId,
                    // orderType: serviceFields.catMainInfo.,
                    updatedAt: serviceFields.catMainInfo.updatedAt,
                    orderTitle: serviceFields.catMainInfo.catTitle,
                    orderInvoice: state.invoice)
                );
              }
              else if(state is SendDataErrorState){
                context.getBack();
                showAdaptiveDialog<Widget>(
                  context: context,
                  builder: (context) =>  ErrorDialog(errorText: state.errorMsg),
                );
              }
            },
            builder: (context,state) {
         return   serviceFields.serviceFields.isNotEmpty ? SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 32.w),
           physics: AlwaysScrollableScrollPhysics(),
              child: SizedBox(
                child: Form(
                  key: AppKeys.orderFormKey,
                  child: Column(
                      children:
                      [
                        SizedBox(
                          height: 16.h,
                        ),
                        ServiceTypeCard(
                            serviceType: serviceFields.catMainInfo.catTitle),
                            // 'cleaning.house_cleaning'.tr(context)),
                        // SizedBox(
                        //   height: 32.h,
                        // ),
                        // ... _createChildren(widget.serviceFields.serviceFields),
                        Expanded(
                            flex: 0,
                            child: ListView.builder(
                          shrinkWrap:  true,
                            physics: NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            itemCount: serviceFields.serviceFields.length,
                            itemBuilder: (context,index){
                            final FieldInfo field = serviceFields.serviceFields[index];
                            if(field.type == 'text' || field.type == 'url' || field.type == 'number' || field.type == 'email' || field.type == 'textarea'){
                              return RenderWidget().renderTextField(context, field);
                            }
                            else if (field.type == 'array' ){
                              return RenderWidget().renderMultiInputField(context, field);

                            }
                            else if (field.type == 'select' && field.options != null){
                             return RenderWidget().renderDropDownCollection(context, field);
                            }
                            else if (field.type == 'radio' && field.options != null){
                              return RenderWidget().renderRadioCollection(context, field);
                            }
                            else if (field.type == 'checkbox' ){
                              return RenderWidget().renderCheckboxCollection(context, field);
                            }
                            else
                              if (field.type == 'datetime-local'){
                              // else if (field.type == 'date'){
                              return RenderWidget().renderDateWidget(context, field);
                            }
                            else if (field.type == 'range'){
                              return RenderWidget().renderSliderWidget(context, field);
                            }
                            else if (field.type == 'file'){
                              return RenderWidget().renderFileWidget(context, field);
                            }
                            else if (field.type == 'color'){
                              return RenderWidget().renderColorWidget(context, field);
                            }
                            else  return SizedBox();
                        })),
                        SizedBox(height: 86.h),
                        AppButton(onTap: () async {
                          if(AppKeys.orderFormKey.currentState!.validate()) {
                            if (serviceFields.serviceFields.any((element) => element.type == 'datetime-local') && context
                                .read<MainCubit>()
                                .choseDate == null) {
                              await showAdaptiveDialog(
                                  context: context, builder: (context) {
                                return ErrorDialog(
                                    errorText: 'Please choose date');
                              });
                            }
                            else
                              await context.read<MainCubit>().sendOrderDate(
                                  data: context
                                      .read<MainCubit>()
                                      .userInputs,
                                  id: serviceFields.catMainInfo.catId,
                                  updated: serviceFields.catMainInfo.updatedAt
                              );
                          }
                        }, buttonText: 'next'),
                        SizedBox(height: 53.h),
                      ]
                  ),
                ),
              ),
            )
             : Center(child: Text('sorry, there is no form for this order yet ',style: AppTextStyles.title2TextStyle,),)
         ;
          }
        ),
      ),
    );
  }
}
