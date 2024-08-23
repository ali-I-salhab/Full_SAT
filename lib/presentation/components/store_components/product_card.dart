import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:osta/core/constants/app_colors.dart';
import 'package:osta/core/extensions/app_sizes.dart';
import 'package:osta/core/localization/app_localizations.dart';
import 'package:osta/core/utils/app_text_styles.dart';
import 'package:osta/data/models/store_product.dart';
import 'package:osta/logic/store/main_store_cubit/main_store_cubit.dart';
import 'package:osta/presentation/components/join_application_components/label_text.dart';
import 'package:osta/presentation/components/long_centered_text.dart';
import 'package:osta/presentation/components/order_components/title_subtitle_detail.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});

  final StoreProductModel product;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.r)),
      elevation: 2,
      margin: EdgeInsets.symmetric(vertical: 8.h),
      child: Stack(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                flex: 1,
                child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(6.r),
                        bottomLeft: Radius.circular(6.r)),
                    child: Image.asset(
                      'assets/images/uploaded.png',
                      fit: BoxFit.cover,
                      width: 151.w,
                    )),
              ),
              // SizedBox(width: 14.w,),
              Expanded(
                // height: 135.h,
                // width: 150.w,
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.all(14.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    // mainAxisSize: MainAxisSize.min,
                    children: [
                      Wrap(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // crossAxisAlignment: CrossAxisAlignment.end,
                        crossAxisAlignment: WrapCrossAlignment.end,
                        runAlignment: WrapAlignment.spaceBetween, spacing: 30.w,
                        children: [
                          TitleSubtitleDetail(
                            title: product.prodName,
                            subtitle: 'store.price'.tr(context) +
                                ' : ${product.price} IDQ',
                            padding: 4,
                          ),
                          FittedBox(
                              fit: BoxFit.cover,
                              child: Text(
                                'store.quantity'.tr(context) +
                                    ' :${product.count}',
                                style: AppTextStyles.title4TextStyle,
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                              )),
                        ],
                      ),
                      SizedBox(
                        height: 7.h,
                      ),
                      Text('store.description'.tr(context),
                          style: AppTextStyles.title3TextStyle),
                      Text(
                        product.prodDesc,
                        // 'Lorem ipsum dolor sit amet consectetur. Sit aenean faucibus vel odio tristique porttitor egestas vitae ipsum.',
                        softWrap: true,
                        style: AppTextStyles.textStyle12,
                        maxLines: 6,
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis,
                      ),
                      // LongCenteredText(text: 'Lorem ipsum dolor sit amet consectetur. Sit aenean faucibus vel odio tristique porttitor egestas vitae ipsum.',isCenter: false,),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Align(
              // Positioned(
              //     top: 0,
              //     right: 0,
              alignment: AlignmentDirectional.topEnd,
              child: Container(
                  // padding: EdgeInsets.symmetric(vertical: 2,horizontal: 2),
                  width: 39.w,
                  height: 33.h,
                  decoration: BoxDecoration(
                      color: AppColors.lightBackgroundColor,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(6.r),
                          topLeft: Radius.circular(6.r))),
                  child: IconButton(
                      onPressed: () async {
                        await context.read<MainStoreCubit>().addToCart(product);
                      },
                      icon: Center(
                          child: Icon(
                        Iconsax.shopping_cart_copy,
                        color: AppColors.primaryColor,
                        size: 24.w,
                      )))))
        ],
      ),
    );
  }
}
