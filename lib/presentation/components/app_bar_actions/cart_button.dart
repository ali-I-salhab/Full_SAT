import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:osta/core/constants/app_colors.dart';
import 'package:osta/core/extensions/app_navigator.dart';
import 'package:osta/logic/store/main_store_cubit/main_store_cubit.dart';
import 'package:osta/presentation/router/routes.dart';

class CartButton extends StatelessWidget {
  const CartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(4.w),
      child: CircleAvatar(
        radius: 52.r,
        backgroundColor: Colors.white,
        foregroundColor: AppColors.secondaryColor,
        child: IconButton(onPressed: ()async{
         await context.read<MainStoreCubit>().getCartProducts();
          context.navigateTo(routeName: Routes.shoppingCartViewRoute);
        },icon: Icon(Iconsax.shopping_cart_copy,size: 24.w,),),
      ),
    );
  }
}
