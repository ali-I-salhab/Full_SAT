import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:osta/core/constants/app_colors.dart';
import 'package:osta/core/extensions/app_navigator.dart';
import 'package:osta/core/extensions/app_sizes.dart';
import 'package:osta/core/localization/app_localizations.dart';
import 'package:osta/presentation/components/categories_grid_view.dart';
import 'package:osta/presentation/components/category_card.dart';
import 'package:osta/presentation/components/custom_app_bar.dart';
import 'package:osta/presentation/components/suctom_search_bar.dart';
import 'package:osta/presentation/router/routes.dart';

class FurnitureCategoriesScreen extends StatelessWidget {
  const FurnitureCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: CustomAppBar(title: 'cleaning.furniture_cleaning'.tr(context)),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.w),
            child: Column(
              children: [
                SizedBox(height: 24.h,),
                CustomSearchbar(),
                SizedBox(height: 32.h,),
                Expanded(child:
                GridView.builder(
                    physics: AlwaysScrollableScrollPhysics(),
                    shrinkWrap: true,
                    primary: false,
                    padding: EdgeInsets.symmetric(horizontal: 0.w),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 174.w / 174.h,
                      mainAxisExtent: 174.w,
                      crossAxisCount: 2,
                      crossAxisSpacing: 16.w,
                      mainAxisSpacing: 16.w,
                    ),
                    itemCount: 7,
                    // shrinkWrap: true,
                    // padding: EdgeInsets.all(2),
                    itemBuilder: (context,index){
                      return InkWell(
                          onTap: (){
                            if(index == 0){
                              context.navigateTo(routeName: Routes.interiorGlassCleaningOrderViewRoute);
                            }else if(index == 1){
                              context.navigateTo(routeName: Routes.carpetCleaningOrderViewRoute);
                            }else if(index == 2){
                              context.navigateTo(routeName: Routes.sofaCleaningOrderViewRoute);
                              }else if(index == 3){
                                context.navigateTo(routeName: Routes.curtainsCleaningOrderViewRoute);
                              }
                              else if(index == 4){
                                context.navigateTo(routeName: Routes.medicalEquipmentCleaningOrderViewRoute);
                            }          else if(index == 5){
                                context.navigateTo(routeName: Routes.officeEquipmentCleaningOrderViewRoute);
                            }         else if(index == 6){
                                context.navigateTo(routeName: Routes.kitchenEquipmentCleaningOrderViewRoute);
                            }
                          },
                          child: CategoryCard(title: 'category name',image: 'assets/images/group.png',));
                    }
                ),),

              ],
            ),
          )
      ),
    );
  }
}
