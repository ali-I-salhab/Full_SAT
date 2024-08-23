import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:osta/core/constants/app_colors.dart';
import 'package:osta/core/extensions/app_sizes.dart';
import 'package:osta/core/localization/app_localizations.dart';
import 'package:osta/data/models/field_info.dart';
import 'package:osta/logic/main_cubit/main_cubit.dart';
import 'package:osta/presentation/components/appointment_container.dart';
import 'package:osta/presentation/components/bottom_sheets/select_time_bottom_sheet.dart';
import 'package:osta/presentation/components/join_application_components/label_text.dart';
import 'package:osta/presentation/components/order_components/title_subtitle_detail.dart';

class AppointmentBookingWidget extends StatelessWidget {
  const AppointmentBookingWidget({super.key,this.field});
  final FieldInfo? field;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LabelText(labelText: 'order_details.appointment_booking'.tr(context),),
        SizedBox(height: 16.h,),
        StatefulBuilder(
          builder: (context,setState) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AppointmentContainer(title: 'order_details.standard'.tr(context), subtitle: '20-30 Min',icon: Iconsax.clock_copy, onTap: (){
                  setState((){
                    context.read<MainCubit>().choseDate = 'standard';
                    // context
                    //     .read<MainCubit>()
                    //     .userInputs[field?.name]
                    // !.update("value", (value) => DateTime.now());

                    context.read<MainCubit>().userInputs[field?.name??''] ={"value": DateTime.now(),"cost":field?.price} ;
                  });
                },
                isChosen:     context.read<MainCubit>().choseDate== 'standard',
                ),
              SizedBox(width: 16.w,) ,
                AppointmentContainer(title: 'order_details.schedule'.tr(context), subtitle: 'order_details.select_time'.tr(context),icon: Iconsax.calendar_tick_copy, onTap: ()async{
                  await showModalBottomSheet(
                  showDragHandle: true,
                  isScrollControlled: true,
                  context: context,
                  backgroundColor: Colors.transparent,
                  builder: (context) {
                    return SelectTimeSheet(field: field,);
                  }).then((value) => setState((){    context.read<MainCubit>().choseDate= 'schedule';}));
                },
                isChosen:     context.read<MainCubit>().choseDate == 'schedule',),
              ],
            );
          }
        ),
      ],
    );
  }
}
