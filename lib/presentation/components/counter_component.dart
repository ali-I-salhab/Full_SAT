import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:osta/core/constants/app_colors.dart';
import 'package:osta/data/models/store_product.dart';
import 'package:osta/logic/store/main_store_cubit/main_store_cubit.dart';
import 'package:osta/logic/store/main_store_cubit/main_store_state.dart';

class CounterComponent extends StatelessWidget {
  const CounterComponent({super.key, required this.prod});

  final StoreProductModel prod;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainStoreCubit, MainStoreState>(
      builder: (context, state) {
        return Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 15,
                backgroundColor: Colors.transparent,
                child: IconButton(
                  onPressed: () {
                    context.read<MainStoreCubit>().increaseQuantity(prod);
                  },
                  icon: Icon(
                    Iconsax.add_circle_copy,
                    size: 20.w,
                    // Icons.minimize_outlined,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
              Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(4.r)
                  ),
                  child: Text(
                      context.read<MainStoreCubit>().cart[prod.prodId].toString()
                      // prod.count.toString()
        )
        ),
              CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.transparent,
                  foregroundColor: AppColors.primaryColor,
                  child: IconButton(
                    onPressed: () {
                      context.read<MainStoreCubit>().decreaseQuantity(prod);
                    },
                    icon: Icon(Iconsax.minus_cirlce_copy,
                      color: AppColors.primaryColor,
                      size: 20.w,
                    ),
                  )
              )
            ]);
      },
    );
  }
}
