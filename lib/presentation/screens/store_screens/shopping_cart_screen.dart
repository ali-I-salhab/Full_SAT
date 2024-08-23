import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:osta/core/constants/app_colors.dart';
import 'package:osta/core/extensions/app_navigator.dart';
import 'package:osta/core/extensions/app_sizes.dart';
import 'package:osta/core/localization/app_localizations.dart';
import 'package:osta/core/utils/app_text_styles.dart';
import 'package:osta/logic/store/main_store_cubit/main_store_cubit.dart';
import 'package:osta/logic/store/main_store_cubit/main_store_cubit.dart';
import 'package:osta/logic/store/main_store_cubit/main_store_state.dart';
import 'package:osta/presentation/components/app_button.dart';
import 'package:osta/presentation/components/custom_app_bar.dart';
import 'package:osta/presentation/components/join_application_components/label_text.dart';
import 'package:osta/presentation/components/store_components/shopping_cart_item.dart';
import 'package:osta/presentation/router/routes.dart';

class ShoppingCartScreen extends StatelessWidget {
  const ShoppingCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainStoreCubit, MainStoreState>(
  builder: (context, state) {
    final basket = context.read<MainStoreCubit>().cartProducts;
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        appBar: CustomAppBar(title: 'store.basket'.tr(context)),
        body: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 32.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: basket.length,
                    itemBuilder: (context, index) {
                      return Dismissible(
                          key: Key(basket[index].prodId.toString()),
                          background: Container(
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(6.r),
                            ),
                            margin: EdgeInsets.symmetric(vertical: 8.h),
                            child: Icon(
                              Iconsax.trash_copy,
                              color: Colors.white,
                            ),
                          ),
                          direction: DismissDirection.startToEnd,
                          onDismissed: (direction) async{
                            await context.read<MainStoreCubit>().removeFromCart(basket[index]);
                            // state.cartProducts.remove(product);
                          },
                          child: ShoppingCartItem(cartProd:basket[index]));
                    }),
              ),
              SizedBox(height: 50.h,)
            ],
          ),
        ),
        bottomSheet: Container(
          color:Colors.transparent,
          // AppColors.lightBackgroundColor,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(topRight: Radius.circular(16.r),topLeft: Radius.circular(16.r))
            ),
            elevation: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal:30.w),
              // width: double.infinity,
              height: 150.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
               crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 27.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                          Text( 'common.total'.tr(context),style: AppTextStyles.labelTextStyle,),
                          Text("100 IQD",style: AppTextStyles.subtitleStyle),
                        ],),
                  SizedBox(height: 27.h,),
                  AppButton(
                    onTap: (){
                      context.navigateTo(routeName: Routes.orderCostDetailsViewRoute);
                    },
                    buttonText: 'store.checkout'.tr(context),
                    // btnWidth: context.width*0.8,
                  ),
                ],),
            ),
          ),
        ),
      ),
    );
  },
);
  }
}
