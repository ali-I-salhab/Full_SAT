import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:osta/core/localization/app_localizations.dart';
import 'package:osta/core/utils/app_text_styles.dart';
import 'package:osta/presentation/components/custom_app_bar.dart';
import 'package:osta/presentation/components/join_application_components/label_text.dart';
import 'package:osta/presentation/components/offer_slider.dart';

class TenderOfferDetailsScreen extends StatelessWidget {
  const TenderOfferDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'Construction tender',
        ),
        body: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 32.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 32.h,),
             LabelText(labelText: 'common.date'.tr(context) ),

              SizedBox(height: 32.h,),
             LabelText(labelText: 'tender.details'.tr(context)),
              SizedBox(
                height: 16.h,
              ),
              Text(
                  style: AppTextStyles.title2TextStyle,
                  textAlign: TextAlign.start,
                  softWrap: true,
                  '''
        Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. In eu mi bibendum neque egestas congue quisque egestas diam. Volutpat blandit aliquam etiam erat velit scelerisque. Enim eu turpis egestas pretium aenean pharetra magna. Ac odio tempor orci dapibus. Massa massa ultricies mi quis hendrerit dolor magna eget. Etiam erat velit scelerisque in dictum non consectetur. Egestas dui id ornare arcu odio. Purus semper eget duis at tellus. Ultricies integer quis auctor elit sed vulputate mi.
Nulla pellentesque dignissim enim sit amet. Pellentesque habitant morbi tristique senectus et netus et malesuada fames. Gravida dictum fusce ut placerat orci. Fames ac turpis egestas integer eget aliquet. Quam pellentesque nec nam aliquam sem et tortor. Proin libero nunc consequat interdum varius sit amet mattis. Sed risus ultricies tristique nulla aliquet enim. Praesent tristique magna sit amet purus. Nam aliquam sem et tortor. Nunc scelerisque viverra mauris in aliquam. Luctus venenatis lectus magna fringilla urna porttitor rhoncus dolor. Nec dui nunc mattis enim ut tellus elementum sagittis.
'''
              ),
              SizedBox(height: 32.h,),
              LabelText(labelText: 'common.location'.tr(context)),
              SizedBox(
                height: 16.h,
              ),
              Text(
                  style: AppTextStyles.title2TextStyle,
                  textAlign: TextAlign.start,
                  softWrap: true,
                  '''
        Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. In eu mi bibendum neque egestas congue quisque egestas diam
'''),
              SizedBox(height: 32.h,),
              SizedBox(height: 32.h,),
              LabelText(labelText: 'tender.contact_numbers'.tr(context)),
              SizedBox(
                height: 16.h,
              ),
              Text(
                  style: AppTextStyles.title2TextStyle,
                  textAlign: TextAlign.start,
                  softWrap: true,
        '0999999999'),
              Text(
                  style: AppTextStyles.title2TextStyle,
                  textAlign: TextAlign.start,
                  softWrap: true,
        '0999999999'),
              SizedBox(height: 32.h,),
              OfferSlider(),
            ],
          ),
        ),
      ),
    );

  }
}
