import 'package:another_stepper/another_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:osta/core/constants/app_colors.dart';
import 'package:osta/core/localization/app_localizations.dart';
import 'package:osta/presentation/components/custom_app_bar.dart';
import 'package:osta/presentation/components/join_application_components/label_text.dart';
import 'package:osta/presentation/components/long_centered_text.dart';

class OrderTrackerScreen extends StatelessWidget {
  const OrderTrackerScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: CustomAppBar(title: 'requests.order_tracking'.tr(context)),
      body: Column(
        // mainAxisSize: MainAxisSize.min,
        children:[ Expanded(
          child: Padding(
            padding: EdgeInsets.all(16),
            child:
// AnotherStepper(
//   // barThickness: 2.w,
// inverted: true,
//     stepperList: [
//   StepperData(
//     title:StepperText('requests.receiving_the_order'.tr(context)) ,
//     subtitle: StepperText('requests.the_request_has_been_received_from_the_administration'.tr(context)),
//     // iconWidget:
//   ),  StepperData(
//
//     title:StepperText('Receiving the order') ,
//     subtitle: StepperText('The request has been received from the administration'),
//     iconWidget:Icon(Icons.done),
//   ),
// ],
// activeBarColor: AppColors.primaryColor,
//     activeIndex: 1,
//     stepperDirection: Axis.vertical),
            Stepper(
                type: StepperType.vertical,
                margin: EdgeInsets.all(12),
                currentStep: 0,

                connectorThickness: 2,
                connectorColor: MaterialStateProperty.all(AppColors.primaryColor),
                controlsBuilder: (BuildContext context,ControlsDetails details){
                  return Container();
                },
                steps: [
              Step(title: LabelText(labelText: 'requests.receiving_the_order'.tr(context),padding: 8), content: Text(''),isActive: true,state: StepState.complete,subtitle: LongCenteredText(text: 'requests.the_request_has_been_received_from_the_administration'.tr(context),isCenter: false,padding: 8),),
              Step(title: LabelText(labelText: 'requests.start_moving'.tr(context),padding: 8), content: Text(''),isActive: true,state: StepState.complete,subtitle: LongCenteredText(text: 'requests.the_worker_is_on_his_way_to_you_please_wait'.tr(context),isCenter: false,padding: 8),),
              Step(title: LabelText(labelText: 'requests.start_the_service'.tr(context),padding: 8), content: Text(''),isActive: false,state: StepState.complete,label: Text(' '),subtitle: LongCenteredText(text: 'requests.start_maintenance'.tr(context),isCenter: false,padding: 8),),
              Step(title: LabelText(labelText: 'requests.finishing_work',padding: 8), content: Text(''),isActive: false,state: StepState.complete,label: Text('label'),subtitle: LongCenteredText(text: 'requests.with_your_permission_rate_the_experience'.tr(context),isCenter: false,padding: 8),),
          ]
              // Tracker

            // OrderTracker(
            //     status: Status.outOfDelivery,
            // activeColor: AppColors.primaryColor,
            //   inActiveColor: AppColors.grey,
            //   orderTitleAndDateList: orderList,
          //   //   shippedTitleAndDateList: shippedList,
          //   //   outOfDeliveryTitleAndDateList: outOfDeliveryList,
          //   //   deliveredTitleAndDateList: deliveredList,
          //   ),
          //   ),
        ),

        ),
        ),
])
    );
  }
}
