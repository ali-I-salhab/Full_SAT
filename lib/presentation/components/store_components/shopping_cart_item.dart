import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:osta/core/localization/app_localizations.dart';
import 'package:osta/core/utils/app_text_styles.dart';
import 'package:osta/data/models/store_product.dart';
import 'package:osta/presentation/components/counter_component.dart';
import 'package:osta/presentation/components/order_components/title_subtitle_detail.dart';

class ShoppingCartItem extends StatelessWidget {
  const ShoppingCartItem({super.key,required this.cartProd});
  final StoreProductModel cartProd;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.r)),
      elevation: 2,
      margin: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          // Container(
          //     width: context.width*0.35,
          //     height:context.width*0.5,
          //     padding: EdgeInsets.symmetric(horizontal: 8,vertical: 8),
          Expanded(
            flex: 1,
            child: ClipRRect(
                borderRadius:BorderRadius.circular(0),
                child: Image.asset('assets/images/uploaded.png',fit: BoxFit.cover,)),
          ),

          Expanded(
            flex: 2,
            // padding: EdgeInsets.symmetric(horizontal: 8,vertical: 8),
            // width: context.width*0.55,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.w,vertical: 16.h),
              child:
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(cartProd.prodName,style: AppTextStyles.title2TextStyle,),
                  SizedBox(height: 18.h,),
                  Text( 'store.price'.tr(context)+' : ${cartProd.price} IDQ',style: AppTextStyles.subTitleTextStyle,),
                ],
              )
              // TitleSubtitleDetail(title: 'Subject name', subtitle: 'store.price'.tr(context)+': 250 IDQ',padding: 14,),
            ),
          ),
          Expanded(
              flex: 1,
              child: CounterComponent(prod:cartProd)),
        ],
      ),
    );
    // return Card(
    //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
    //   child: Row(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: [
    //       Image.asset('assets/images/uploaded.png',fit: BoxFit.cover,),
    //       TitleSubtitleDetail(title: 'subject name', subtitle: 'price: 250 IDQ'),
    //
    //       IconButton(onPressed: (){}, icon: Icon(Icons.add_shopping_cart_outlined))
    //     ],
    //   ),
    //
    // );

  }
}
