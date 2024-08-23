import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:intl/intl.dart';
import 'package:osta/core/constants/app_colors.dart';
import 'package:osta/core/extensions/app_navigator.dart';
import 'package:osta/core/extensions/app_sizes.dart';
import 'package:osta/core/localization/app_localizations.dart';
import 'package:osta/core/utils/app_text_styles.dart';
import 'package:osta/data/models/field_info.dart';
import 'package:osta/logic/main_cubit/main_cubit.dart';
import 'package:osta/presentation/components/app_button.dart';
import 'package:osta/presentation/components/app_text_field.dart';
import 'package:osta/presentation/components/join_application_components/label_text.dart';

class SelectTimeSheet extends StatefulWidget {
   SelectTimeSheet({super.key, this.field,this.chosen});
  final FieldInfo? field;
  String? chosen ;

  @override
  State<SelectTimeSheet> createState() => _SelectTimeSheetState();
}

class _SelectTimeSheetState extends State<SelectTimeSheet> {
  TextEditingController hourController = TextEditingController();
  TextEditingController minController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    DateTime? selectedDate =DateTime.now();
    return SafeArea(
      child: Container(
        // color: AppColors.lightBackgroundColor,
        color: Colors.transparent,
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: SingleChildScrollView(
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.r),
              topRight: Radius.circular(16.r),
            )),
            child: Padding(
              padding: EdgeInsets.only(
                left: 32.w,
                right: 32.w,
                // bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 36.h,
                  ),
                  Center(
                      child: Text(
                    'order_details.schedule_appointment'.tr(context),
                    style: AppTextStyles.titleTextStyle,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 4,
                    softWrap: true,
                  )),
                  SizedBox(
                    height: 16.h,
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.r)),
                    ),
                    color: Colors.black12,
                    elevation: 0,
                    // ),
                    child: Padding(
                      padding: EdgeInsets.all(8.w),
                      child: CalendarDatePicker(
                        initialCalendarMode: DatePickerMode.day,
                        currentDate: DateTime.now(),
                        initialDate: DateTime.now(),
                        // firstDate: DateTime.now(),
                        firstDate: DateTime.utc(DateTime.now().year,
                            DateTime.now().month, DateTime.now().day),
                        lastDate: DateTime.utc(2025, 12, 31),
                        onDateChanged: (date) {
                          selectedDate = date;
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
// ),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Iconsax.clock_copy,
                        size: 24.w,
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Expanded(
                          child: Text(
                        'order_details.available_time'.tr(context),
                        style: AppTextStyles.titleTextStyle,
                      ))
                    ],
                  ),
                  SizedBox(
                    height: 14.h,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppTextField(
                        width: 172.w,
                        labelText: 'Hr',
                        inputType: TextInputType.number,
                        controller: hourController,
                      ),
                      Text(
                        ' : ',
                        style: AppTextStyles.titleTextStyle,
                      ),
                      // LabelText(labelText: ' : ',padding: 8,),
                      AppTextField(
                          width: 172.w,
                          labelText: 'Min',
                          inputType: TextInputType.number,
                          controller: minController),
                    ],
                  ),
                  SizedBox(
                    height: 53.h,
                  ),
                  AppButton(
                      onTap: () {
                        // selectedDate. = hourController.text ;
                        // selectedDate?.minute = minController.text ;
                        // if( minController.text == '' || hourController.text = '')
                        if (selectedDate != null )
                          context
                              .read<MainCubit>().
                          userInputs[widget.field?.name??'']
                          // !.update("value", (value) =>
                          ={"value":    DateTime(
                                  selectedDate!.year,
                                  selectedDate!.month,
                                  selectedDate!.day,
                                  int.parse(hourController.text),
                                  int.parse(minController.text)),
      "cost":widget.field?.price
                        };


                        if (selectedDate != null && minController.text != '' && hourController.text != '')
                        setState(() {
                          context.read<MainCubit>().choseDate= 'schedule';
                        });

                          // context
                          //         .read<MainCubit>()
                          //         .userInputs[widget.field?.name] ={
                        //
                        // "value": DateTime(
                        //           selectedDate!.year,
                        //           selectedDate!.month,
                        //           selectedDate!.day,
                        //           int.parse(hourController.text),
                        //           int.parse(minController.text)),
                        //   "label": widget.field?.label
                        // };
                        // print(DateTime(selectedDate!.year,selectedDate!.month,selectedDate!.day,int.parse(hourController.text),int.parse(minController.text)));
                        context.getBack();
                        hourController.clear();
                        minController.clear();
                      },
                      buttonText: 'order_details.confirm_schedule'.tr(context)),
                  SizedBox(
                    height: 36.h,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
