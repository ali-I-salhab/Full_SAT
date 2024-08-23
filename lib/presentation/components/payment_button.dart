import 'package:flutter/material.dart';
import 'package:osta/core/constants/app_colors.dart';
import 'package:osta/core/localization/app_localizations.dart';
import 'package:osta/logic/themes/app_theme.dart';

class PaymentButton extends StatelessWidget {
  PaymentButton(
      {Key? key,
        required this.onTap,
        required this.buttonText,
        this.btnWidth,
        this.btnHeight,
        this.color,
        this.isLoading,
      })
      : super(key: key);
  Function() onTap;
  String buttonText;
  double? btnWidth;
  double? btnHeight;
  Color? color;
  bool? isLoading=false;

  @override
  Widget build(BuildContext context) {
    final size =MediaQuery.of(context).size;
    return SizedBox(
      width: btnWidth ?? size.width * 0.85,
      height: btnHeight ?? size.height* 0.06,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: color ?? AppColors.btnColor,
          ) ,
          onPressed: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('order_details.payment_methods'.tr(context),
                    style: TextStyle(color:Colors.white,fontSize: size.width *0.04)),
              ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('order_details.cash'.tr(context),
                    style: TextStyle(color:Colors.white,fontSize: size.width *0.04)),
          ),
            ],
          ),

        ),
      ),
    );
  }
}