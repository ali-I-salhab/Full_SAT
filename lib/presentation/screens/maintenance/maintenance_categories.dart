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
import 'package:osta/presentation/components/join_application_components/label_text.dart';
import 'package:osta/presentation/components/store_components/store_category_container.dart';
import 'package:osta/presentation/components/subtitle_row.dart';
import 'package:osta/presentation/components/suctom_search_bar.dart';
import 'package:osta/presentation/router/routes.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class MaintenanceCategoriesScreen extends StatelessWidget {
  const MaintenanceCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ItemScrollController itemScrollController = ItemScrollController();
    final ItemPositionsListener itemPositionsListener = ItemPositionsListener.create();
    return SafeArea(
      child: Scaffold(
          appBar: CustomAppBar(title: 'home.maintainance'.tr(context)),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.w),

            child: Column(
              children: [
                SizedBox(height: 24.h,),
                CustomSearchbar(),
                SizedBox(height: 16.h,),
                SubtitleRow(subtitle: 'common.categories'.tr(context),onTap: (){},),
                SizedBox(height: 16.h,),

                Container(
                  height: 40.h,
                  width: double.infinity,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: 5,
                      // padding: EdgeInsets.only(right: 16.w),
                      itemBuilder: (context, index) {
                        return InkWell(
                            onTap: (){
                              // scrollController.animateTo(3, duration: Duration(milliseconds: 500), curve: Curves.bounceInOut);
                              // scrollController.jumpTo(5);
                              itemScrollController.scrollTo(
                                  index: 2,
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.easeInOutCubic);
                            },
                            child: StoreCategoryItem());
                      }),
                ),
// SizedBox(height: 24.h,),
                Expanded(child:
                ScrollablePositionedList.builder(
                  itemScrollController: itemScrollController,
                  itemPositionsListener: itemPositionsListener,
                  shrinkWrap: true,
                  itemCount: 5,
                  padding: EdgeInsets.zero,
                  physics: AlwaysScrollableScrollPhysics(),
                  itemBuilder:(context,index)=> Column(
                    children: [
                      SizedBox(height: 32.h,),
                      LabelText(labelText: 'maintenance category'),
                      SizedBox(height: 16.h,),
                      GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          primary: false,
                          padding: EdgeInsets.zero,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 174.w / 174.h,
                            mainAxisExtent: 174.w,
                            crossAxisCount: 2,
                            crossAxisSpacing: 16.w,
                            mainAxisSpacing: 16.w,
                          ),
                          itemCount: 6,
                          itemBuilder: (context,index){
                            return InkWell(
                                onTap: (){
                                  if(index == 0){
                                    context.navigateTo(routeName: Routes.basicMaintenanceWorkOrderViewRoute);
                                  }
                                  else if(index == 1){
                                    context.navigateTo(routeName: Routes.paintingOrderViewRoute);
                                  }
                                  else if(index == 2){
                                    context.navigateTo(routeName: Routes.decorationOrderViewRoute);
                                  }
                                  else if(index == 3){
                                    context.navigateTo(routeName: Routes.frontageWorkOrderViewRoute);
                                  }
                                  else if(index == 4){
                                    context.navigateTo(routeName: Routes.airConditioningAndRefrigrationWorkOrderViewRoute);
                                  }
                                  else if(index == 5){
                                    context.navigateTo(routeName: Routes.isolationWorkOrderViewRoute);
                                  }
                                },
                                child: CategoryCard(title: 'category name',image: 'assets/images/group.png',));
                          }
                      ),
                    ],
                  ),
                ),),

              ],
            ),
          )
      ),
    );
  }
}
