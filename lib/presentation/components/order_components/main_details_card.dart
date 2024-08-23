import 'package:flutter/material.dart';
import 'package:osta/core/constants/app_colors.dart';
import 'package:osta/core/extensions/app_navigator.dart';
import 'package:osta/core/localization/app_localizations.dart';
import 'package:osta/presentation/components/app_button.dart';
import 'package:osta/presentation/components/order_components/order_detail_row.dart';
import 'package:osta/presentation/router/routes.dart';

class MainDetailsCard extends StatelessWidget {
   MainDetailsCard({super.key, this.isConfirm =false});
   bool isConfirm ;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      // margin: EdgeInsets.all(20),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(2.0),
            child: ListView.separated(
            physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.all(0),
              itemCount: 5,
              itemBuilder: (context, index) {
                return OrderDetailRow(icon: Icons.numbers_outlined, detailTitle: 'order number', detailVal: '0123456');
              },
              separatorBuilder: (context,index)=>
                  Divider(
                    indent: 20,
                    endIndent: 20,
                    thickness: 1,
                    color: Colors.black,
                  ),

            ),
          ),
      isConfirm?    Padding(
            padding: const EdgeInsets.all(16.0),
            child: AppButton(onTap: (){
              context.navigateTo(routeName: Routes.waitingViewRoute);
            }, buttonText: 'common.confirm'.tr(context),color: AppColors.confirmBtnColor,),
          ) : Container()
        ],
      ),
    );
  }
}
