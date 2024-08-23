import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:osta/core/extensions/app_navigator.dart';
import 'package:osta/core/localization/app_localizations.dart';
import 'package:osta/presentation/components/custom_app_bar.dart';
import 'package:osta/presentation/components/store_components/store_category_container.dart';
import 'package:osta/presentation/components/subtitle_row.dart';
import 'package:osta/presentation/components/tender_components/tender_offer_card.dart';
import 'package:osta/presentation/components/tender_components/tender_offer_dialog.dart';
import 'package:osta/presentation/router/routes.dart';

class TenderOfferScreen extends StatelessWidget {
  const TenderOfferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(title: 'tender.tender_offer'.tr(context),),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 32.0.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 24.h,),
              SubtitleRow(subtitle: 'common.categories'.tr(context) ,),
              SizedBox(height: 10.h,),
              Container(
                height: 40.h,
                width: double.infinity,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: 5,
                    // padding: EdgeInsets.only(right: 16.w),
                    itemBuilder: (context, index) {
                      return StoreCategoryItem();
                    }),
              ),
              SizedBox(height: 32.h,),
              Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return InkWell(
                          onTap: ()async{
                            // await showAdaptiveDialog(context: context, builder: (context){
                            //   return TenderOfferDialog();
                            // });

                            context.navigateTo(routeName: Routes.tenderOfferDetailsViewRoute);
                          },
                          child: TenderOfferCard()) ;
                    }),
              )
            ],
          ),
        ),
      ),
    );

  }
}
