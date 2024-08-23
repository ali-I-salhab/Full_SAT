import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:osta/core/localization/app_localizations.dart';
import 'package:osta/presentation/components/join_application_components/label_text.dart';

class MoreDetailsRow extends StatelessWidget {
  const MoreDetailsRow({super.key,this.isAddPictures = false});
  final bool? isAddPictures;
  @override
  Widget build(BuildContext context) {
    return               Row(
      children: [
        Icon(Iconsax.add_square_copy,size: 24.w,),
        SizedBox(width: 8.w,),
        LabelText(
          labelText:isAddPictures ==true ? 'order_details.add_pictures_optional'.tr(context) :'order_details.more_details_optional'.tr(context),
        ),
      ],
    );
  }
}
