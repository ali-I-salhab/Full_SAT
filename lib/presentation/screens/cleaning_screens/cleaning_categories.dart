import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:osta/core/constants/app_colors.dart';
import 'package:osta/core/extensions/app_navigator.dart';
import 'package:osta/core/extensions/app_sizes.dart';
import 'package:osta/core/localization/app_localizations.dart';
import 'package:osta/data/models/category_model.dart';
import 'package:osta/logic/main_cubit/main_cubit.dart';
import 'package:osta/logic/main_cubit/main_cubit.dart';
import 'package:osta/logic/main_cubit/main_state.dart';
import 'package:osta/presentation/components/app_error_dialog.dart';
import 'package:osta/presentation/components/app_loading_dialog.dart';
import 'package:osta/presentation/components/category_card.dart';
import 'package:osta/presentation/components/custom_app_bar.dart';
import 'package:osta/presentation/components/suctom_search_bar.dart';
import 'package:osta/presentation/router/routes.dart';
import 'package:osta/presentation/screens/main_order_screen.dart';

class CleaningCategoriesScreen extends StatelessWidget {
  const CleaningCategoriesScreen({super.key,required this.categories});
  final List<CategoryModel> categories;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(title: 'common.cleaning'.tr(context)),
        body: BlocConsumer<MainCubit, MainState>(
          listener: (context,state) async{
            if(state is GetScreenFormLoadingState){
              showAdaptiveDialog<Widget>(
                context: context,
                barrierDismissible: false,

                builder: (context) => const LoadingDialog(),
              );
            }
            else if(state is GetScreenFormSuccessState){
              context.getBack();
              // context.navigateTo(
              //     routeName: Routes
              //         .cleaningCategoriesViewRoute,arguments: state.screenFields);
              Navigator.push(context, MaterialPageRoute(builder: (context)=>MainOrderScreen(serviceFields: state.serviceFields,)));

            }
            else if(state is GetScreenFormErrorState){
              context.getBack();
              showAdaptiveDialog<Widget>(
                context: context,
                builder: (context) =>  ErrorDialog(errorText: state.errorMsg),
              );
            }
          },
          builder: (context, state) {
    return Padding(
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
                  padding: EdgeInsets.zero,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 174.w / 174.h,
                      mainAxisExtent: 174.w,
                      crossAxisCount: 2,
                      crossAxisSpacing: 16.w,
                      mainAxisSpacing: 16.w,
                    ),
                    itemCount: categories.length,
                    // shrinkWrap: true,
                    // padding: EdgeInsets.all(2),
                    itemBuilder: (context,index){
                      return InkWell(
                          onTap: ()async{
                            // if(index == 0){
                            //   context.navigateTo(routeName: Routes.houseCleaningOrderViewRoute);
                            // }else if(index == 1){
                            //   context.navigateTo(routeName: Routes.commercialCleaningOrderViewRoute);
                            // }else if(index == 2){
                            //   context.navigateTo(routeName: Routes.buildingCleaningOrderViewRoute);
                            // }else if(index == 3){
                            //   context.navigateTo(routeName: Routes.furnitureCleaningCategoriesViewRoute);
                            // }
                            // else if(index == 4){
                            //   context.navigateTo(routeName: Routes.frontageCleaningOrderViewRoute);
                            // }       else if(index == 5){
                            //   context.navigateTo(routeName: Routes.hardWorkCleaningCategoriesViewRoute);
                            // }       else if(index == 6){
                            //   context.navigateTo(routeName: Routes.sterilizationCleaningCategoriesViewRoute);
                            // }
                            // context.read<MainCubit>().setInitVals();
                            await context.read<MainCubit>().getScreenForm(categories[index].catId);

                          },
                          child: CategoryCard(title:categories[index].catTitle,image: categories[index].catLogo,));
                    }
                ),),

            ],
          ),
        );
  },
)
      ),
    );
  }
}
