import 'package:flutter/material.dart';
import 'package:osta/core/localization/app_localizations.dart';
import 'package:osta/presentation/components/app_button.dart';
import 'package:osta/presentation/components/custom_app_bar.dart';
import 'package:osta/presentation/components/long_centered_text.dart';
import 'package:osta/presentation/components/waiting_widget.dart';

class WaitingScreen extends StatelessWidget {
  const WaitingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: ''),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
      //pass image and text to this widget based on order status
          Expanded(child: WaitingWidget()),
          // SizedBox(height: ,),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 70 ,horizontal: 8.0),
            child: AppButton(onTap: (){
            }, buttonText: 'common.cancel'.tr(context),color: Colors.black12),
          ),
        ],
      ),
    );
  }
}
