import 'package:flutter/material.dart';
import 'package:osta/core/constants/app_colors.dart';
import 'package:osta/core/extensions/app_navigator.dart';
import 'package:osta/core/extensions/app_sizes.dart';
import 'package:osta/core/localization/app_localizations.dart';
import 'package:osta/core/utils/app_text_styles.dart';
import 'package:osta/presentation/components/app_button.dart';
import 'package:osta/presentation/components/custom_app_bar.dart';
import 'package:osta/presentation/components/order_components/main_details_card.dart';
import 'package:osta/presentation/router/routes.dart';

class ConfirmOrderDetailsScreen extends StatelessWidget {
  const ConfirmOrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'common.order_details'.tr(context)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            MainDetailsCard(isConfirm: true),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AppButton(onTap: (){
              }, buttonText: 'order_details.cancel_order'.tr(context),color: Colors.black12),
            ),
            SizedBox(height: context.height*0.05,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 8),
              child: Center(
                child: Text('order_details.wait_for_the_technician_to_prepare_his_equipment'.tr(context),softWrap: true,style: AppTextStyles.subtitleStyle.copyWith(fontSize: 18),maxLines: 2,textAlign: TextAlign.center,overflow: TextOverflow.ellipsis,),
              ),
            ),
            SizedBox(height: context.height*0.05,),

          ],
        ),
      ),
    );
  }
}
