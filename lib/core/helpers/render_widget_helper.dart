import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:osta/core/utils/app_text_styles.dart';
import 'package:osta/core/utils/numiric_range_formatter.dart';
import 'package:osta/core/utils/text_field_currency_formatters.dart';
import 'package:osta/data/models/field_info.dart';
import 'package:osta/logic/main_cubit/main_cubit.dart';
import 'package:osta/presentation/components/app_text_field.dart';
import 'package:osta/presentation/components/cleaning_orders_components/custom_checkbox.dart';
import 'package:osta/presentation/components/cleaning_orders_components/custom_radio_button.dart';
import 'package:osta/presentation/components/cleaning_orders_components/custom_range_slider.dart';
import 'package:osta/presentation/components/color_picker.dart';
import 'package:osta/presentation/components/join_application_components/app_drop_down.dart';
import 'package:osta/presentation/components/join_application_components/label_text.dart';
import 'package:osta/presentation/components/multi_fields_inputs.dart';
import 'package:osta/presentation/components/order_components/appointment_booking_widget.dart';
import 'package:osta/presentation/components/upload_multiple_images_widget.dart';

class RenderWidget {

  Widget renderTextField(BuildContext context, FieldInfo field) {
    return Column(
      children: [
        SizedBox(
          height: 32.h,
        ),
        LabelText(labelText: field.label?.toUpperCase() ?? '',trailing:
        field.type == 'number' ?
        ' \$ ${field.price}': null),
        SizedBox(
          height: 16.h,
        ),
        StatefulBuilder(
          builder: (context, setState) {
            final type = field.type;
            return AppTextField(
              inputType: type == 'textarea'
                  ? TextInputType.multiline
                  : type == 'email'
                      ? TextInputType.emailAddress
                      : type == 'number'
                          ? TextInputType.number
                          :type == 'url'
                  ?TextInputType.url
                  : TextInputType.text,
              inputFormatters:
                  type == 'number' ? [
                    CurrencyInputFormatter(),
                    // field.max !=null ?
                    FilteringTextInputFormatter.digitsOnly,
                    NumericRangeFormatter(
                        max: field.max !=null ? double.tryParse(field.max!) ?? 50 : null,
                        min: field.min != null ? double.tryParse(field.min!) ?? 0 : 0,
                        )
                        // : null
                  ] : null,
              labelText: field.placeholder,
              // hintText: field.placeholder,
              maxLines: type == 'textarea' ? 5 : null,
              height: type == 'textarea' ? 102.h : null,
              onFieldSubmit: (value) {
                print(value);
                setState(() => context
                    .read<MainCubit>()
                    .userInputs[field.name]
                // !.update("value", (value) => value,) ,);
                =
                {
                 "value": value ?? '',
                  "cost":field.price,
                //   "label":field.label
                }
                );
                print(value);
              },
              validator: (value){
                if(field.validation != null && field.validation!.contains('required')) {
                  if (value == null || value == '') {
                    return 'This field is required';
                  }
                }
                return null;
              },
            );
          },
        ),
      ],
    );
  }

  Widget renderRadioCollection(BuildContext context, FieldInfo field) {
    return StatefulBuilder(
      builder: (context, setState) {
        return Column(
          children: [
            SizedBox(
              height: 32.h,
            ),
            LabelText(labelText: field.label?.toUpperCase() ?? '',
            trailing:
        context.read<MainCubit>().userInputs[field.name]?['value'] != null ?
        '\$ '+field.options!.singleWhere((element) => element.optionValue == context.read<MainCubit>().userInputs[field.name]?['value']).optionPrice.toString() : null,
            ),
            SizedBox(
              height: 16.h,
            ),
          Column(
                  children: field.options!
                      .map((e) => CustomRadioButton(
                            radioTitle: e.optionLabel,
                            radioVal: e.optionValue!,
                            groupVal:
                                context.read<MainCubit>().userInputs[field.name]?['value'] ??
                                    field.selectedValue.toString(),
                            isSelected: field.selectedValue ==
                                (e.optionValue == '0' ? 0 : 1),
                            onChanged: (val) {
                              setState(() => context
                                  .read<MainCubit>()
                                  .userInputs[field.name]
                                  // .update("value", (value) => val)
                              =
                                  {
                                    "value": val.toString(),
                                    "cost": e.optionPrice
                                  }
                              );
                              print(val);
                            },
                          ))
                      .toList())
          ]
        );
      }
    );
  }

  Widget renderMultiInputField(BuildContext context, FieldInfo field) {
    return Column(
      children: [
        SizedBox(
          height: 32.h,
        ),
        LabelText(labelText: field.label?.toUpperCase() ?? '',),
        SizedBox(
          height: 16.h,
        ),
        StatefulBuilder(builder: (context, setState) {
          return MultiFieldsInput(field: field);
        }),
      ],
    );
  }

  Widget renderCheckboxCollection(BuildContext context, FieldInfo field) {
    return Column(
      children: [
        SizedBox(height: 12.h,),
        StatefulBuilder(builder: (context, setState) {
          return Wrap(
            runAlignment: WrapAlignment.spaceBetween,
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              CustomCheckBox(
                checkboxTitle: field.label ?? '',
                price: ' \$ ${field.price}',
                value: context.read<MainCubit>().userInputs[field.name] ==
                    ''
                    ? field.value
                    : context
                    .read<MainCubit>()
                    .userInputs[field.name]?['value'] ==
                    'true'
                    ? true
                    : false,
                onChanged: (val) {
                  setState(() => context
                      .read<MainCubit>()
                      .userInputs[field.name]
                  // !.update("value", (value) => val.toString(), )
                  =
                  {
                   "value": val.toString(),
                  //   "label":field.label,
                    "cost": field.price
                  }
                      );
                  print(val);
                },
              ),
          // Align(
          // alignment: AlignmentDirectional.topEnd,
          // child: Text(field.price.toString(),
          // style: AppTextStyles.title2TextStyle,
          // overflow: TextOverflow.ellipsis,
          // textAlign: TextAlign.end,
          // maxLines: 1,
          // softWrap: true,),
          // )
            ],
          );
        }),
      ],
    );
  }

  Widget renderDropDownCollection(BuildContext context, FieldInfo field) {
    // context.read<MainCubit>().userInputs[field.name] = field.options?[0].optionValue;
    return StatefulBuilder(
      builder: (context,setState) {

        return Column(
          children: [
            SizedBox(
              height: 32.h,
            ),
            LabelText(labelText: field.label?.toUpperCase() ?? '',
                trailing:
            context.read<MainCubit>().userInputs[field.name]?['value'] != null ?
            field.options!.where((element) => element.optionValue == context.read<MainCubit>().userInputs[field.name]?['value'] ).length != 0?
          '\$ '+  field.options!.singleWhere((element) => element.optionValue == context.read<MainCubit>().userInputs[field.name]?['value'] ).optionPrice.toString() : ''
              : null,
            ),
            SizedBox(
              height: 16.h,
            ),
             AppDropDown(
                key: Key(field.name),
                labelText: field.placeholder,
                value:
               // field.options?[0].optionValue,
                  // == null ? " ":
        context.read<MainCubit>().userInputs[field.name] != null ?
                field.options!.where((element) => element.optionValue == context.read<MainCubit>().userInputs[field.name]?['value'] ).length != 0?

                context.read<MainCubit>().userInputs[field.name]!["value"] : null : null,

                items: [],
                customItems:
          field.options!.isNotEmpty ?
          field.options!.map((item) {
                  return DropdownMenuItem(
                    value: item.optionValue,
                    child: Text(item.optionLabel),
                  );
                }).toList()
                    : [],
                onChanged: (value) {
print(value);
        setState(() => context
            .read<MainCubit>()
            .userInputs[field.name] =
            {"value":value,
              "cost":field.options!.singleWhere((element) => element.optionValue == value).optionPrice,
            });
        print(value);
        },
            isRequired: field.validation?.contains('required'),
              )
          ],
        );
      }
    );
  }

  Widget renderDateWidget(BuildContext context, FieldInfo field) {
   return  Column(
     children: [
       SizedBox(
         height: 32.h,
       ),
       AppointmentBookingWidget(field: field),
     ],
   );
  }

  Widget renderFileWidget(BuildContext context, FieldInfo field) {
    return Column(
      children: [
        SizedBox(
          height: 32.h,
        ),
        Divider(
          thickness: 2,
        ),
        SizedBox(
          height: 24.h,
        ),
        UploadMultipleImagesWidget(
          files: context.read<MainCubit>().pickedFiles,
          fieldName: field.name,
        ),
        SizedBox(
          height: 24.h,
        ),
        Divider(
          thickness: 2,
        ),
      ],
    );
  }

  Widget renderColorWidget(BuildContext context, FieldInfo field) {
    return Column(
      children: [
        SizedBox(
          height: 32.h,
        ),
        AppColorPicker(field: field)

      ],
    );
  }

  Widget renderSliderWidget(BuildContext context, FieldInfo field) {
    // context.read<MainCubit>().userInputs[field.name] = double.tryParse(field.defaultVal!);
    return Column(
      children: [
        SizedBox(
          height: 32.h,
        ),
        LabelText(labelText: field.label?.toUpperCase() ?? '',trailing:
          field.price!= null ? ' \$ ${field.price}' : null
          ),
        SizedBox(
          height: 16.h,
        ),
        StatefulBuilder(
          builder: (context,setState) {
            return CustomSlider(
              min:field.min !=null ? double.tryParse(field.min!) : 0.0,
              max:field.max !=null ? double.tryParse(field.max!) : 200.0,
              division: 1,
              sliderValue: double.tryParse(context.read<MainCubit>().userInputs[field.name]?['value'].toString() ?? '') ?? 0.0,
              onChanged: (value){
                setState((){
                  context.read<MainCubit>().userInputs[field.name] = {"value": value,
                    "cost":field.price ?? 0.0
                  } ;
                });
              },);
          }
        )
      ],
    );
  }

}
