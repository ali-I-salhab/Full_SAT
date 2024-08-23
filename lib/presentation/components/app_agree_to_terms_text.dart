import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:osta/core/extensions/app_navigator.dart';
import 'package:osta/core/localization/app_localizations.dart';
import 'package:osta/core/utils/app_text_styles.dart';
import 'package:osta/presentation/router/routes.dart';

class AgreeToTermsText extends StatelessWidget {
  const AgreeToTermsText({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      children: [
        FittedBox(
          child: Text(
            'sign_in.by_signin_you_agree'.tr(context)+'  ',
            overflow: TextOverflow.visible,
            style: AppTextStyles.title3TextStyle,
            softWrap: true,maxLines: 3,
          ),
        ),

        InkWell(
          onTap: (){
            context.navigateTo(routeName: Routes.termAndConditionViewRoute);
          },
          child: Text(
            'sign_in.terms_\$_conditions'.tr(context),
            style: AppTextStyles.title3TextStyle.copyWith(fontWeight: FontWeight.w700),softWrap: true,maxLines: 2,
          ),
        ),
      ],
    );
  }
}
